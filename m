Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7E4C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 09:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bP+IUq0326ZlmpZ81mrcAidOpaHmKMzVCI4CLiGRKhQ=; b=WX0Ed/yf6e0AHrgGHC0mAR4dn2
	RTNVsnR7MLZXQNCoxfooAadE70dMMAfS9YPpt0JcGPWtTGvUrKn/kdpkxtN8U1nHKvM22p4AvwrG/
	Vf83WpUOZpkohsXEFtFbXAkqx9Ap6hXhVWmsQ0wwKBt2B5Hnw/IXyuW6tw7OxGVKRIlIVjE5csreQ
	ZET+6b5XG6R6Hdugjnt6hGrHiBZtmgdu8xID0eOTfKePERcMsPO0ZhV2dSeI15z/jYnByju52T0cT
	P0S7vPSPdXu2F7vnVrmlqHbwtbZ2QsPGSjW4HmOcLZxNFucu3HPeGVh56c+hNSd+0Trr5iw1Dv0VM
	I7V+DNDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBBLe-007aOC-JH; Fri, 30 Dec 2022 09:06:42 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBBLH-007aBd-PN; Fri, 30 Dec 2022 09:06:21 +0000
Received: by mail-pg1-x530.google.com with SMTP id w37so13848705pga.5;
        Fri, 30 Dec 2022 01:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bP+IUq0326ZlmpZ81mrcAidOpaHmKMzVCI4CLiGRKhQ=;
        b=oiHDncSnmHC8UvxbCTR7OiQZIy38GxkCdI4YTsizlLlgro4VM6eLUdipCJzD7uxI1f
         p9yER92AZ4L60T7KvnybTK7U61fBd+K/YF4pknZjZ5KSz0/uXIQ2D3ZN0YhQPTChF/vr
         1poYE5QK27yDdWmkxUzOGSHkIjcPv6PExtC/Pg4sqQGfStGQs42hkgzm9jA4hxqPkm6n
         B1qZe0qwUEcViTTFqOt5VzgURggQNhMYnKLqebsMmX3jnKTVDlCHGBEARQ6lZz/uDzcQ
         KUmmWkyfVKoSRIxHleBwpSG9JmX7Yhjyr7l/0sCEsMAEnL7X80CE5oe+Ysa4IwawPapJ
         M7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bP+IUq0326ZlmpZ81mrcAidOpaHmKMzVCI4CLiGRKhQ=;
        b=jSVSF3Vf3sjXcHChGJR6oI6YbQuxE+CkP1cqI6368/PNQ2U81MofDBRpTTQzTv1IMj
         eiPe8PzBXiirfVX8yXtUVH4QDdMRPaR/LiRoLLLrsU+u3jD+siapN6U7+ZGIkK/k1Ira
         tZPqmSCGI4VXb6nXojiIaZjhXXHl4UGoYcM+pwGgC8ale97fxSRMP2gLW08MS2S9EFsg
         ImX1EFbJVfMh8TD+1CFKnXx1sbTIsrc786aHi3A88xMSKrnMw3E9dHbvkISkawiHLJCo
         IdDfmr5DgifhU7XNQG2JCstb6RcsCVXDI8hZxWtLGi/X2VS7X94omDW+mjjFkUyoeURp
         wNrg==
X-Gm-Message-State: AFqh2kocNzsjTgVV+J9/sLOl+w4ueCk024mV+rdkQj4QDSUSUQmj3XVB
	xvfksP1uT4fblY5sl8rETao=
X-Google-Smtp-Source: AMrXdXspCnTe70fh8Lq/lLsOywuqsOA9QI5jVwM/C/3SpZJRFb3L6/s1+BY0PFBtBKT92J3E0URH8w==
X-Received: by 2002:a05:6a00:1f0d:b0:56c:3696:ad68 with SMTP id be13-20020a056a001f0d00b0056c3696ad68mr31487128pfb.8.1672391176849;
        Fri, 30 Dec 2022 01:06:16 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-69.three.co.id. [180.214.232.69])
        by smtp.gmail.com with ESMTPSA id n7-20020a622707000000b00580c0219f16sm8616883pfn.169.2022.12.30.01.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Dec 2022 01:06:16 -0800 (PST)
Message-ID: <69095f6d-2f1d-07ab-26ac-5f35ea80a58a@gmail.com>
Date: Fri, 30 Dec 2022 16:06:10 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [V2] media: jpeg: Fix multi-hw judgement
To: =?UTF-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
 "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 =?UTF-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "tfiga@chromium.org" <tfiga@chromium.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?UTF-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?=
 <Maoguang.Meng@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?WGlhIEppYW5nICjmsZ/pnJ4p?= <Xia.Jiang@mediatek.com>
References: <20221216035247.18816-1-irui.wang@mediatek.com>
 <Y6w2wG2MlIiHlkr/@debian.me>
 <0846a7d726135d28f1da2a94eaa4c978754f9d2f.camel@mediatek.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <0846a7d726135d28f1da2a94eaa4c978754f9d2f.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_010619_900675_D86A9786 
X-CRM114-Status: GOOD (  12.47  )
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

On 12/29/22 15:19, Kyrie Wu (吴晗) wrote:
> On Wed, 2022-12-28 at 19:29 +0700, Bagas Sanjaya wrote:
>> On Fri, Dec 16, 2022 at 11:52:47AM +0800, Irui Wang wrote:
>> > From: kyrie wu <kyrie.wu@mediatek.com>
>> > 
>> > some chips have multi-hw, but others have only one,
>> > modify the condition of multi-hw judgement
>> 
>> nit: s/judgement/conditional block/ ...
>> 
>> > -if (list_empty(&pdev->dev.devres_head)) {
>> > +if (!jpeg->variant->hw_arch) {
>> 
>> ... like here (if block).
>> 
>> Thanks.
> 
> Hi Bagas,
> 
> I can't get your suggestion exactly.
> Do you mean to change if (...) as follows:
> if (jpeg->variant->hw_arch)

No, not what I mean. I pointed you at the correct terminology
with your code as example.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara


