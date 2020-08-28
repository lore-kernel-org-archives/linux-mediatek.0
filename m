Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3AAC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 10:12:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6DA12078A
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 10:12:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LrV5Ve11";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZDezp3wk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6DA12078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4hLX1Ms2fFvd3n4wC9AL5B47DYCZ8w751qWyLfKgMuY=; b=LrV5Ve11R4T5eO8QHzZR/TWP7
	g0OWXO1bliZZsEYo7n69juGHY6RY5hLExU0LEig9cQzEKUvPSVLXxR3CDNJy6y3JtD+odlO2I3TlG
	t3SP+76jhsTYIYG3VFP93lqlfPp3RN5EtQTFfhFMyVzH6Ve9r6UBDYuPQmq6ASCiem/y+vSD9sIlw
	rKXLZRhN8p5M4LxmhqMOSdVt1P+5zPrhrKbVhL/2GvDrV00Y681W9htIjpvbSQlRb/6PhPeM+Tp44
	7piOAdLyHxcBHIp5XNS7AeKPp6IDc/UbjllPAIGsyx5XA3HCJD+zFb99b8ajm0JOT0GuCWHJ3hlR2
	YHizO3pgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBbMy-00040y-AX; Fri, 28 Aug 2020 10:12:28 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBbMt-0003yx-7p
 for linux-mediatek@lists.infradead.org; Fri, 28 Aug 2020 10:12:24 +0000
Received: by mail-wm1-x343.google.com with SMTP id t2so428568wma.0
 for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2020 03:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=8Ovq6P3MQ3z6dqGKr0Zb9utX+dneiZHadAh26MWglZM=;
 b=ZDezp3wkEqtgdk6LmoGQzRQAoxHxEoE6rmuSVOSht7+w5dF0j0t+Vo/9Iy0v6Vr8ZQ
 90M6+oCgfkbk782ciBITtNz/PGaHbvXI1im6Cg7Ar47ZRO749/qpJlSJoKOf3AImpA5c
 kDuLG0cktm73ACvMnjXYG6RIjYk1isLNXulrfQ9tijq4yj+N7q7f4XYXmrXi1y2Mf8bA
 tC/ke+Dx4BziV1myVVkTFooasFkI9oTIIv+GVyPLsNpOJCjL3FiyJurngi6Z2PyHxQbM
 irOhPCAd/ohUAWI/ZIcj9rIyBlecrWgSqqO2UI5ZvaDYxz+xzdetbdtLR7h0zgLqRUcp
 4o7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8Ovq6P3MQ3z6dqGKr0Zb9utX+dneiZHadAh26MWglZM=;
 b=XwE3ESXrASOYeymGv7O7xcwcivsWpidGngd395RfiGlboIt7xV54DUUecKwiyMHDXN
 fYHWCsoOvuMh52N7kFMU26xrfcoL03EmSW4tPK/RVaW7740GxWePBW3TBZSeGMAX2ahF
 4NQHo6DkT/tsA1MEQ5yr7MQwWqVBrhZ1e4pqSfWABjjsypchZY5joxN9PxD2iESqvxP5
 8X2CMCLt9QmAbitTu5qvdY0wlsTCb5LV4hYv7XfG0/Aq3jNG+s6qAU5d5/3Q/hxvIjJ1
 QyCWWqq/AHa8Mi8eltIhyX91S/gW0VtbU7IC/SRIVDbqO3qzWFQSXI4o6s53UOoOLZm9
 De+w==
X-Gm-Message-State: AOAM532qZOBG7XRUpoqjjfxuMpZ+C/qx/Fsbw9WyOezDW11M1wDlnKvo
 2NUwP/SVIR7iM5WMCY6hwyR7Dw==
X-Google-Smtp-Source: ABdhPJyKmmE5smzdiPFgAo8SYJdXe+GE4Q9uo0Te9LwlUMOPWP9Iygbh8Dex7htNXU7nZnetQsDnUQ==
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr940437wma.100.1598609542190; 
 Fri, 28 Aug 2020 03:12:22 -0700 (PDT)
Received: from dell ([91.110.221.141])
 by smtp.gmail.com with ESMTPSA id g18sm1251588wru.27.2020.08.28.03.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:12:21 -0700 (PDT)
Date: Fri, 28 Aug 2020 11:12:19 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v4 1/9] mfd: mt6360: Rearrange include file
Message-ID: <20200828101219.GK1826686@dell>
References: <1597661277-27862-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597661277-27862-2-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597661277-27862-2-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_061223_303571_E5AB9522 
X-CRM114-Status: GOOD (  10.05  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxNyBBdWcgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBSZWFycmFuZ2UgaW5jbHVkZSBmaWxlIHdpdGhv
dXQgc29ydGluZyBieSBhbHBoYWJldC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENoZW4gPGdl
bmVfY2hlbkByaWNodGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYyB8
IDcgKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKRm9yIG15IG93biByZWZlcmVuY2UgKGFwcGx5IHRoaXMgYXMtaXMgdG8geW91ciBzaWdu
LW9mZiBibG9jayk6CgogIEFja2VkLWZvci1NRkQtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVh
ZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
