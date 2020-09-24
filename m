Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4836C4363D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 12:42:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 448B0206D9
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 12:42:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AB5A9m+R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X1LVvTRs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 448B0206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QlE34tCV0Cku60Rj6rHf71v/4T3YsIw8XI64yNDzuDg=; b=AB5A9m+RuLczAWdCQNroG98c5
	uj+HTpGGOEN0fxGborCISfZKdUpt9J9eIQ894tWuT64H57E7FuYGfAfpaQ3dnNvfdPxedixFTwomI
	OeGCIRt7vLHXFJ5haZHhO60uo2A+qsuzdc/patEZnvWw3xiNDDdHGxlmU0FrJ0KEbWBHep62iImdu
	ZljLZvURM1vcSC2OGwyBtC6ie1FwN6TssRTN/2PGymMQkuSWNpCN87uP3VjLgChCQpVfn4+E78UjK
	z0iqhoADouOhO3NRAyeczUKRTb4zgSW4WL2Gi/nwVjqzrP1eTGT8qsQHNPlnjp9JgeEiyMeT2UNUM
	nHqRiFi/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLQZv-0005F8-9s; Thu, 24 Sep 2020 12:42:27 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLQZi-00059Z-Mt
 for linux-mediatek@lists.infradead.org; Thu, 24 Sep 2020 12:42:16 +0000
Received: by mail-wm1-x344.google.com with SMTP id x23so3375125wmi.3
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2020 05:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hOdMr4z55y7m7sInvhahv883Nzw4CA2e6+vBER7Lkgk=;
 b=X1LVvTRsoWnLc/tlMzEdUlaLLa/Mc+PPd1dPAzm1ooceZGCXUh7/IEZugJcWOmepRZ
 GeSYBaziRvTrY+eH+k9YC22kK6mkyF6XwsLyaW8feBMHQ21tSTdnKtClsBuulZ3DAyp+
 vTFnF6cvWo+XQdCDLTcPzkyywh7meFZj4xkhnpHYzytJqv1c+HD4cjCvg6hgMmCqyEux
 Ri96TXQSykfD0N1ymbWQCikxogDPZ1CPirstYnw8zEWn6oAX4k8zA6KYS1qX+2OM4FSq
 WWhUKEKbbGaUWW+yd+kDYZX5bVagsYfnZcYf7nLuVhSnXUVN6oSI2SMQx4w8P5BLFh8X
 P40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hOdMr4z55y7m7sInvhahv883Nzw4CA2e6+vBER7Lkgk=;
 b=idtny/BrE1TL80w+08FP3nl1V77OKcgi0FM9QEodXYgbJ0JQ5+3qiyw65/FABouv5L
 hI+rEDyr4Q9cX7XuBnUotgWu8RHCDgLtxZOzB+Jc6o+0FXyznUnTSD56hylnCiFz0/Pw
 G9vfah1wCBbNPog0jIkFo4iMp8wMdmUYWMETMotiwkhGTp6Nc1yOnnD18D9OP0YHwc9G
 UqifpXCuL8SdisiyEBXLe57/QmguNHxip++c6HnZiLKDVdyasuoOYTzy4AN/GOG5jDC8
 KKs9mzZtVlRMnyfTLLYiTiNGopXXOktor8mMsVNWhxhbveKE1IeKNEudaMtB4zT+pk59
 Yuzg==
X-Gm-Message-State: AOAM531ih6qZLwXBGIUofj5tylft4Kwm6RNK3E6oNqTfbP6eeIlpoG78
 dXWfkbsYj0ctTDYF4WMyOW6TlA==
X-Google-Smtp-Source: ABdhPJy6WEyI2TEYojR2YX/nEcp2VQQw6hJS/44FfWdWWIxB1UV7hUg1HHH4twHysn3pBlq8qVl2mw==
X-Received: by 2002:a1c:1983:: with SMTP id 125mr4429708wmz.29.1600951333815; 
 Thu, 24 Sep 2020 05:42:13 -0700 (PDT)
Received: from dell ([91.110.221.204])
 by smtp.gmail.com with ESMTPSA id t6sm3473010wre.30.2020.09.24.05.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 05:42:13 -0700 (PDT)
Date: Thu, 24 Sep 2020 13:42:11 +0100
From: Lee Jones <lee.jones@linaro.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] mfd: mt6360: Remove unused including
 <linux/version.h>
Message-ID: <20200924124211.GL4678@dell>
References: <20200914142518.39228-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914142518.39228-1-yuehaibing@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_084214_828051_2A3CA2F6 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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
Cc: matthias.bgg@gmail.com, gene_chen@richtek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxNCBTZXAgMjAyMCwgWXVlSGFpYmluZyB3cm90ZToKCj4gUmVtb3ZlIGluY2x1ZGlu
ZyA8bGludXgvdmVyc2lvbi5oPiB0aGF0IGRvbid0IG5lZWQgaXQuCj4gCj4gUmVwb3J0ZWQtYnk6
IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJp
bmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tZmQvbXQ2MzYwLWNv
cmUuYyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKQXBwbGllZCwgdGhh
bmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBE
ZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9y
IEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
