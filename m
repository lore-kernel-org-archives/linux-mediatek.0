Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D826C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:38:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF9C961050
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF9C961050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/jzuWn1Z6LDAgPKAhbaLKz8vqbvzaZ8cqzJrY36Rm7Q=; b=vczZd6s9btAnF2
	CiDDHgzphxG9jX56lF9d/bzk5C/gNeFhq/pnwYmt0sVblEuj2A/0H8Ys3dCFR9dM3Dinvcp37iPYS
	1IvOZ09bl5jvmKnLXPC0DpoeDGKhUZiwZEinbnY/JNjhJAkcBAf5rg5ebduhy5H+H+c3JS7/YHmiU
	J4h++0WcgZGokyX8i1hcyee/cwnHD4vSTMIRpTWmES3BYnzcdKVqenKui0zL97Uej3ts9Fyux+MKO
	j7R5nACMGxcgz3QLT2lGHaS6cO67N6eAC6Vc6XEyw988pWh/FBFjDMjw4TW3VnE7FDdqT51Bd3UD0
	fVUHfvhvazBYMG0lAD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Eqq-00DBzF-RO; Tue, 27 Jul 2021 04:37:56 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Eqd-00DBxz-Tl
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 04:37:45 +0000
Received: by mail-pj1-x1029.google.com with SMTP id mt6so16079264pjb.1
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 21:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sHCpjMG3bJheGspgPwPgXoTuuhMeCojN1Vcw1raYNbg=;
 b=XImY6I5BO9PSo6vX6AyLIflKwvN5weee2a4Oh4nHjX8SbZeTMAYJXg0QeK2FKOnAh2
 J7Iao0Pmh2ZE30+livAgtKfi6ljvex1FccPw3GWqwx2pJ3E6axqUC/LTf0Atarck2uor
 KuPkt8VrZlVVYG3ft4eCSuLwyqmxlEFIJFots=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sHCpjMG3bJheGspgPwPgXoTuuhMeCojN1Vcw1raYNbg=;
 b=mSE+Aoi2uVxPcnT5n6YX9GVNFCQYK/hg6anbxU/tJNTYFplP9CB1QeXwSEtRo0Ctdd
 Mypwf3axo/dxVuXhXbvzcoID7JsXsvXWNx8mWw9ge+XVeuVkUg3RVK2A4jRBbB93WXkR
 FmKDz2Ac0BmWJ8Cv+tT1xm9AWxJzvk4ZZBaTbZUzXn64guHwDC8apzLRTFOTaua2m3b2
 d+eXudQJnZ53Hn0ZOoAuihj0/olDVRtc8AZJjYjgwu/EvJj5d60abJbYN+W7aMGwP1Qi
 dhkAbrPu6FPSH3b0RAfSFHDd0RO1H0TATsCDXhKCJWTQDrV6hjNCv5+u2UDVjBUzeHXl
 dMRA==
X-Gm-Message-State: AOAM532zzImi9KH4crjctI6K/yzxmGmhK7rDFAjD+l9/CPxKCnUPfZVv
 hLG2FQ0EWW7BR1YrzNp7CYd4zl5kZrz5VwU+OFfMSQ==
X-Google-Smtp-Source: ABdhPJxoMQnZyC8tW7HpIKMFF7+41G/TLa4K7yYK4o+MYvmtPlRKMcIhTLK2m30euPRcf43I2fDHvUwmfzLx9pB6wjg=
X-Received: by 2002:a17:90a:8403:: with SMTP id
 j3mr2289387pjn.112.1627360662060; 
 Mon, 26 Jul 2021 21:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-6-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-6-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 27 Jul 2021 12:37:31 +0800
Message-ID: <CAATdQgBdSqotJ_ZWSGzq7SbK-=qzwc+ptQidNgXFjR2C2VcPgQ@mail.gmail.com>
Subject: Re: [v14 05/21] clk: mediatek: Get regmap without syscon compatible
 check
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_213743_988400_DA888B96 
X-CRM114-Status: UNSURE (   8.07  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 26, 2021 at 6:59 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Not all clock providers need to be marked compatible with "syscon"
> for system configuration usage, so use device_node_to_regmap() to
> skip "syscon" check.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
