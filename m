Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06692CD98E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 12:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6uM0ObpaAPGFXgDRAB4wX+6R8VKBvIYPs4Db/iskdHQ=; b=uKmtonkil7T2Qit7Mk+r6XF9Mb
	pN7XXIFbiYp6nKxy/0locuS/2oicI0T/BLvIKidHXQlvmS0w/+HJhkfTbgJD7mu2LsGzT6oApff1z
	rdXXYmGBHv1ZPlAbPRFH+zGpl/9+D+Ec5SduWvuQ4NBpRIoetNNKat46jGbbuOfGSliG4qe3oafrg
	dkXt1gUWKjrgATm63OfeSQHCtlO7aAd6JkGu8PqQxLzGpMOhMBaXIf7ZVYpIBGiAq1IWOo8YPET2B
	2IWd5MDkBJawqtTVRkdoJWi4+XRysK8BN3J54JlP+/Fy6xzORS6mJWYQHYcpWQZedOm+U1b/rHeK2
	Czl4viAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZT7a-0000000FmNp-3xFq;
	Tue, 16 Jun 2026 12:42:27 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZT7X-0000000FmMv-1uS0
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 12:42:25 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c0c35980fdso45730625ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 05:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781613742; x=1782218542; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6uM0ObpaAPGFXgDRAB4wX+6R8VKBvIYPs4Db/iskdHQ=;
        b=gi7QisEhr5cSMibZHFShv1yOVcBQPejS5ic/4DUxKEn5gDC+06qz9f7/D0AVwdFV2v
         nh1/lcHeFeEntYtx5vTPlZa2XqEf9hER9Ccv1/6zHO7+a7ikajhfN9SEMbWCDsBUzMFk
         2yltvMvOzfqInxl76sGUWXYHctsphU8CG2bUDny0Hno0k6KA3H972MVChltyS6vO+YUl
         yzyYUvM6FTNDPlVonDs233G1ZxIAy+2K26ebWRluAWLMLR1HGtwQJlP2KWqsClBIe7YW
         +et4LTQcEOYWI5stbxbiCa81TAKZewoM3u7Exe7P7chRfu0nu77DDwYa3J1gVFq+yH1c
         /aIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613742; x=1782218542;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6uM0ObpaAPGFXgDRAB4wX+6R8VKBvIYPs4Db/iskdHQ=;
        b=M4lZU71Wn6RZdID6TYH7zpGLCW1hdMfAdtHrFKjnHx+jQNy+SCVTccrLy1Ii06vVzI
         5ZPKW9wA5RSclwuJVZl1kTfuRmiKNzXMrs4VnMWaSrY5flf6osTJV25cVz8qxg8Xax06
         4ri42c2+cHEFAh4d+pBx315nxFHe/zugh3JnQV5U/wvNfntuTbygVDYlG63ztYCM+h1O
         iBmuMSN/uRIup2WWsRIyrwgKoi0eFd/P0R5FeUICIPhQ3Vuh9pi6p1izt43oGw+irqSW
         K7+MCEh5fln8k9RJ4MZP6Sy+tYwhngQc+VZvSGTg96dPYuiX41hPTI0yOapQ/LkNrR+5
         z+6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9wRB4zDjb7h30/oKHvglnWaIw8qif/DzxS8MRaMFbelrfq2L065hg+/j/wUNaYfRdt3DPkC7cqwAQMte6C+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxN0D7rtUfTkvF44P5VZdWrwAeavyRBZTj5lf1SQ9zI5wLVd/im
	Zb+6JMSQQqjc/nhJTSDFaob+xOtKreNqIyxakZms3Cp/wbYpLMMlv3VfYjzoVFfSOaldYg==
X-Gm-Gg: Acq92OF0J7+3fS0mUYYuqUlsOIPbKjubz0/T5rQux0GrydQ7bdg88ciBRO0sSPNjd3i
	/GXWccqMO80iQXjZvRddAb3ZH/McDxM6wQBmspfWWK22o6TdsC8nuDrIcY6kexO7TN1yjDFyeu7
	hC8bXpgdo0XO2mNq93NtvTclGrkUxfOj4YKkNKI7o7Ll4wY9/U2UiZSqFiyPlULpnlGGGo3dLDC
	1xS3q4FiXR+xUDFYTrPhNeGej6bOYYpEBT2uKTtDC2zi0Qvqn71x0PhTlw6Uys0xed6MKGFJdZC
	jGKeqP0Sbf1IXJX1kmr9kjuxRz+oLlmteYa6QV/SHZz5BhrgZhH6XZfUeETV+w+n1R45zXzCbYJ
	RqACE0dtsfcxDFMRi2Cn0/73y22K4yEpm1rw1+v6B8Ftj9wELCxp+IWwPg3fVhHRFgfDXwCtqrY
	43xlUi/CrE/tuAhv1h
X-Received: by 2002:a17:902:c944:b0:2c6:9448:363a with SMTP id d9443c01a7336-2c69a1731b3mr37365455ad.20.1781613742538;
        Tue, 16 Jun 2026 05:42:22 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb50e5sm135274665ad.35.2026.06.16.05.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:42:22 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH net v3] net: airoha: Fix skb->priority underflow in airoha_dev_select_queue()
Date: Sun, 14 Jun 2026 07:30:54 +0800
Message-ID: <178161373805.2167512.2544164327472822616@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_054223_513752_547AAB8B 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

In airoha_dev_select_queue(), the expression:

  queue = (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES;

implicitly converts to unsigned arithmetic: when skb->priority is 0
(the default for unclassified traffic), (0u - 1u) wraps to UINT_MAX,
and UINT_MAX % 8 = 7, routing default best-effort packets to the
highest-priority QoS queue. This causes QoS inversion where the
majority of traffic on a PON gateway starves actual high-priority
flows (VoIP, gaming, etc.).

Fix by guarding the subtraction: when priority is 0, map to queue 0
(lowest priority), otherwise apply the original (priority - 1) % 8
mapping.

Fixes: 2b288b81560b ("net: airoha: Introduce ndo_select_queue callback")
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Reviewed-by: Joe Damato <joe@dama.to>
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..d476ef83c3 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1933,7 +1933,7 @@ static u16 airoha_dev_select_queue(struct net_device *dev, struct sk_buff *skb,
 	 */
 	channel = netdev_uses_dsa(dev) ? skb_get_queue_mapping(skb) : port->id;
 	channel = channel % AIROHA_NUM_QOS_CHANNELS;
-	queue = (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES; /* QoS queue */
+	queue = skb->priority ? (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES : 0;
 	queue = channel * AIROHA_NUM_QOS_QUEUES + queue;
 
 	return queue < dev->num_tx_queues ? queue : 0;
-- 
2.51.0



