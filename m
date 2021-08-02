Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A739AC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 13:09:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7928660FC1
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 13:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7928660FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=F4MMkIrUpHwSQR2Y/rpd7Kj3O1SMMau6/1VsCrb7hGc=; b=C/8
	94See+0MDDjnBEwIAYl3LM6fBm5zjml5l8mPbELTTjXa9+rbH/dYJZ8CF4X+AIluCu6t+m1jUjdIn
	2XzzuTcsff6si+/5VMq2yjwAyuKMZth+rREM83Ba+W0LHjGXO3magd+AymWimA1yH+Z5/Y+PDS7e1
	/hMxsNrFNT67VNAjhjE6Q6x1iZXF0jLYr6kStzvki8NnRhTwk/zKHXZqyQHD7S/Lcd7uv6n4q4ULk
	FbuBS/C6g3BJToJRaqz4oi4qU7c7xfW4UkbbJoWqM+7ZI3yiRRl5OJI4im8/TWHgkfBFn9zkuCaNh
	jP9LLs5i6SHGO7XD0Lb9G+cDklfkLuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAXgf-00GJNp-1m; Mon, 02 Aug 2021 13:08:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAXgb-00GJMW-VE
 for Linux-mediatek@lists.infradead.org; Mon, 02 Aug 2021 13:08:55 +0000
Received: by mail-wm1-x334.google.com with SMTP id m19so10393646wms.0
 for <Linux-mediatek@lists.infradead.org>; Mon, 02 Aug 2021 06:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=b1PrQdRD1EXzejod4gc6MNCc+NCiSV4CCWGOVUmYgTM=;
 b=Z3VVVNW+PNWLwKKg+ocKhOmS8/t+fcgyYf/RlK5Cqi1pvohEckbwP0RCAV7WSYOOb6
 ltbl/0eDbU0icHSc4eH8QI2SH91z4ndsvlc3PY8E+Z5PZW3it3OF06qdSliEJ0/2igyr
 fbcW+Ou+YYG7Fyh+oWW6xHG58kn+I7sk2htJOhqo49Z2RoMZxx9O8Y95uUZNSGU7Yxr9
 cMNXGwysC/tMO81KGOkHIKqon5qrjNby7UMJrw1nWdMEL8X84strf5SVt5C1TVjrDSQF
 p3ID248+WsMkP9igNdC9/pywr8kMI23v3SG1muJBVOwAUlPSn2C2iqbfX1vNEVX5dAlf
 FKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=b1PrQdRD1EXzejod4gc6MNCc+NCiSV4CCWGOVUmYgTM=;
 b=Io1OE96eazC1JEdOaArVvQfO58ZXcHI3nZjW7//I7QWxAX6PLTTpJNpuOXS3EVWWzw
 pekmzZzuc+7zAjAGzhO8EKGMxDgue8HZfeV4hjW/16o+Ozduw+1GsPdMlmKGG5Unn7k3
 vW/kI5FhuyF/2avOhNfYKOLzfUPNJf4WgXC0lW59p4cWFI98PS8jmGV7sAylltxkbrAg
 cGtJwIF0xjbm8DrfgqqjhAFtB4aP4GjNqG0SJovFmODAN8mcSq9gD+vz3O25c2CTd0Ey
 mWRwLaCJhf6WXJjbjKPyaTwP/lOUOTOAKFu+6oX0FiRJuuZFJ6OqSebEljUuR2/r3sqr
 iOnw==
X-Gm-Message-State: AOAM532aymTIeo54N02tobc3cepScvitOQxIx0XRlJ/980ohlvb2ROX6
 t8c65ucK+WijRaRdJAFyJeGUmHkUuUoPOi8SPYrMNLgiwMrOjA==
X-Google-Smtp-Source: ABdhPJz/tQbUccd8wGnXWwUBuzuDHbKz6WgkRjuCigcYQLs1ohsY6RKk4p/V6AQpycwoibX5w81G20hF6oj8qajuyPw=
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr16557777wmq.101.1627909730103; 
 Mon, 02 Aug 2021 06:08:50 -0700 (PDT)
MIME-Version: 1.0
From: Alif Ilhan <alifilhan0@gmail.com>
Date: Mon, 2 Aug 2021 19:07:20 +0600
Message-ID: <CAPfpOrbN28q60z62V0Z0eLHx+QUvkjcauybf5+vrB8R3Ta4M6A@mail.gmail.com>
Subject: Help forward porting a kernel driver
To: Linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_060854_042959_7F1F0D8D 
X-CRM114-Status: UNSURE (   9.88  )
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

Hi,
I am really sorry if I cause any inconvenience asking this but I need
some guidance on porting a mediatek modem driver from downstream
kernel sources. I have been able to compile the modem driver with the
latest linux kernel but the problem is I can't compile it for ARM64. I
can compile the driver for ARM32(arm) but when I try to compile for
ARM64 I get a plain
aarch64-linux-gnu-ld : Unexpected GOT/PLT entries detected!
aarch64-inux-gnu-ld : Unexpected run-time procedure linkages detected!

The code is here,
https://github.com/alifilhan0/linux/tree/linux-5.12-conn/drivers/misc/mediatek/ccci_util
 the problem is with the ccci_util directory, when enabled in the
.config, I get the above errors, all others build fine for both arm
and arm64.

Any help will be greatly appreciated.

Thanks,
Alif

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
