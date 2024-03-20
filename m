Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1888C54E68
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 01:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vslccHoMCWly3ZURU46sxdUj43F/UH9ebalL/ZrLyE=; b=I0qw42pEpG7sPFv6ce7sIJFtt0
	VxYZwWqZL2BxioN3pXbAfSnh3RsTqdSzK0e7yJcx2JgP3TOOXRP9pZ2A8yhTfuf/cvB8joGt08rjq
	rsJzaW2KcQ2q7+Lkdw34MCsFZtRl0oRYxud/zjfUcSkgZx7B4Z43Vo/kKw3tF487U13anpci5GW3/
	NEtuplbK8Dus5JQZjzheCcmKM1A8FNx5cRZqTjQwL9nwwSdVq9PJ9kFlKVRTNbdHsYM7u4wj2dgq8
	t2A7WHuGOx4+R3XJfMsHICudumChaZtx4m68er/JDNP9XiMHOqj8gXvBvxStOSmE2Ds4bnFpfeQ5C
	VUn0+qUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmkSY-0000000ErXJ-3yOa;
	Wed, 20 Mar 2024 01:09:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmkSV-0000000ErW5-0QuL;
	Wed, 20 Mar 2024 01:09:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ECB18CE0EE4;
	Wed, 20 Mar 2024 01:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B4FC433F1;
	Wed, 20 Mar 2024 01:09:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="dQ8BenM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1710896966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0vslccHoMCWly3ZURU46sxdUj43F/UH9ebalL/ZrLyE=;
	b=dQ8BenM7n4QQUbeM1wjdCGNzGSH6TFaQ3XM37L904ZiYEBphDBP1IVzdpgk21HkXPo7MDs
	SUCPBwU6iv45YWyk/jJjXtJtDoRGpwil4kua5uo50FKur821+KYRKpavodlQJdqL6qtH8l
	EC6XNoHZW1Iqz4IrdGKAmEXrWYABtKA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c3249e04 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 20 Mar 2024 01:09:24 +0000 (UTC)
Date: Wed, 20 Mar 2024 02:09:21 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Guoyong Wang <guoyong.wang@mediatek.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH] random: Fix the issue of '_might_sleep' function running
 in an atomic contex
Message-ID: <Zfo3QUFEy4wHkLEB@zx2c4.com>
References: <Zfidal8CEZStp3R7@zx2c4.com>
 <20240319093055.3252-1-guoyong.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240319093055.3252-1-guoyong.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_180935_633508_DE1D6C14 
X-CRM114-Status: GOOD (  22.85  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 19, 2024 at 05:30:55PM +0800, Guoyong Wang wrote:
> On Mon, 18 Mar 2024 21:00:42 +0100, Jason A. Donenfeld wrote:
> > I'm wondering, though, rather than introducing a second function, maybe
> > execute_in_process_context() should just gain a `&& !in_atomic()`.
> > That'd make things a bit simpler.  
> 
> > However, I'm pretty sure in_atomic() isn't actually a reliable way of
> > determining that, depending on config. So maybe this should just call
> > the worker always (if system_wq isn't null).
> 
> > Alternatively, any chance the call to add_input_randomness() could be
> > moved outside the spinlock, or does this not look possible?
> 
> Hi Jason,
> 
> Thanks for your suggestions. 
> 
> I am inclined to accept your second suggestion. My reluctance to accept 
> the first is due to the concern that "&& !in_atomic()" could potentially 
> alter the original meaning of the 'execute_in_process_context' interface. 
> Regarding the third suggestion, modifying the logic associated with 'input' 
> is not recommended.

Doesn't something like the below seem simplest? Just move the call out
of the spinlock and we're done.

diff --git a/drivers/input/input-core-private.h b/drivers/input/input-core-private.h
index 116834cf8868..717f239e28d0 100644
--- a/drivers/input/input-core-private.h
+++ b/drivers/input/input-core-private.h
@@ -10,7 +10,7 @@
 struct input_dev;

 void input_mt_release_slots(struct input_dev *dev);
-void input_handle_event(struct input_dev *dev,
+bool input_handle_event(struct input_dev *dev,
 			unsigned int type, unsigned int code, int value);

 #endif /* _INPUT_CORE_PRIVATE_H */
diff --git a/drivers/input/input.c b/drivers/input/input.c
index f71ea4fb173f..2faf46218c66 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -391,20 +391,22 @@ static void input_event_dispose(struct input_dev *dev, int disposition,
 	}
 }

-void input_handle_event(struct input_dev *dev,
+bool input_handle_event(struct input_dev *dev,
 			unsigned int type, unsigned int code, int value)
 {
 	int disposition;
+	bool should_contribute_to_rng = false;

 	lockdep_assert_held(&dev->event_lock);

 	disposition = input_get_disposition(dev, type, code, &value);
 	if (disposition != INPUT_IGNORE_EVENT) {
 		if (type != EV_SYN)
-			add_input_randomness(type, code, value);
+			should_contribute_to_rng = true;

 		input_event_dispose(dev, disposition, type, code, value);
 	}
+	return should_contribute_to_rng;
 }

 /**
@@ -428,12 +430,15 @@ void input_event(struct input_dev *dev,
 		 unsigned int type, unsigned int code, int value)
 {
 	unsigned long flags;
+	bool should_contribute_to_rng;

 	if (is_event_supported(type, dev->evbit, EV_MAX)) {

 		spin_lock_irqsave(&dev->event_lock, flags);
-		input_handle_event(dev, type, code, value);
+		should_contribute_to_rng = input_handle_event(dev, type, code, value);
 		spin_unlock_irqrestore(&dev->event_lock, flags);
+		if (should_contribute_to_rng)
+			add_input_randomness(type, code, value);
 	}
 }
 EXPORT_SYMBOL(input_event);


