Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A099FC11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 14:35:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F49A61476
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 14:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F49A61476
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksnB50kinqHR1q1wyz/RHEESNWvBOB0OMGnvWnCq05s=; b=C7AU1gYcoRpj1J
	WTuWpaK40dNwwVO0rBqPUKhZOAomElfYwyeDOz7nPNN1UcQUTcZE5GFZWUPiDCr2VEMP39lXt92K3
	AwrkGkpwJFpqPg0dHMICmHJSjZ6zYjQJw4L9MLfS3T/uVciIPdqWAhIFNORdnKa6H+Ss/3Y+1w+yD
	80/75Ef3YXbMxeOE47tysVpm8YwACF3N8KrtIIy9dDly9K5iXSVtbfj62Ts05rnWwvTAsACKyS/Lw
	3sglHG5YJYJJosYBLwhEWlloSbJp//szrAmI4whMO5X0VEyPj0bZ8TQ0TwS3kiWIIUtS+gzvmsh7G
	yR03XQD80nmCbtqDqlQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lybIx-00EPDL-LK; Wed, 30 Jun 2021 14:35:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lybEF-00ENKv-CA; Wed, 30 Jun 2021 14:30:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E659C61477;
 Wed, 30 Jun 2021 14:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625063412;
 bh=Dpokg5mx9PCeNh5Maw6E2HZ+R2pO6FZ5ZVOGUwMTUnI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Rs1HTxCB9KBtPevU+FkuFkvkqPvoEFqidK0qoppQR+j623fy+S0ChY01uwiYH+oCl
 RXHht3wjfdJcWLx3pZYcJ5VOB+UCc3Owu6fil/GUKukwOKOdfkPKPd/2YtdsUoHtPq
 pjJX8rOXEiauam341QGNDuv2MqFOD2qcEbepDdohplEZayheBDeeP74ER2nj31ClL3
 8BmEkhL9sDRrW8IxYYKS4OY7CeNQHr/dD1oFem9eZ/Anqums7ty5xA9o9fXMmxewAA
 KeFwjR1DXlTdJ1nJWtFplaJgRlGLAEnB76T+XIzhvYhMv2mw6c3ExhmGHy5WkzAywK
 r90LTI/f0Wo+w==
Received: by mail-ej1-f54.google.com with SMTP id hr1so1153137ejc.1;
 Wed, 30 Jun 2021 07:30:12 -0700 (PDT)
X-Gm-Message-State: AOAM53162AcnU9aNTP8Dq9IGPQAToeTgg0lZYTv7/k4P/VDRXthw/0eQ
 XSWhVOQN53zW7aaQUWM5uDyfCs5diL/iGnzwCQ==
X-Google-Smtp-Source: ABdhPJyudkUk6/cfP1T21tKXKcYPMVLiZF2tJOPdLVkJd/moWew1wCGN2luO8WUD5eusbGsFuEw4zAqW4fHhB33nLYo=
X-Received: by 2002:a17:907:980f:: with SMTP id
 ji15mr180143ejc.194.1625063411467; 
 Wed, 30 Jun 2021 07:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210630132804.20436-1-chun-jie.chen@mediatek.com>
 <20210630132804.20436-2-chun-jie.chen@mediatek.com>
In-Reply-To: <20210630132804.20436-2-chun-jie.chen@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 30 Jun 2021 22:30:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8SgZ5SN9Q0nfL_jQVTbB7ZDqgoGFRkKe8+QJwUi55Hew@mail.gmail.com>
Message-ID: <CAAOTY_8SgZ5SN9Q0nfL_jQVTbB7ZDqgoGFRkKe8+QJwUi55Hew@mail.gmail.com>
Subject: Re: [v11 01/19] dt-bindings: ARM: Mediatek: Add new document bindings
 of MT8192 clock
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, 
 DTML <devicetree@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_073015_500202_E3052DA0 
X-CRM114-Status: UNSURE (   9.62  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIENodW4tSmllOgoKQ2h1bi1KaWUgQ2hlbiA8Y2h1bi1qaWUuY2hlbkBtZWRpYXRlay5jb20+
IOaWvCAyMDIx5bm0NuaciDMw5pelIOmAseS4iSDkuIvljYg5OjMw5a+r6YGT77yaCj4KPiBUaGlz
IHBhdGNoIGFkZHMgdGhlIG5ldyBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIHN5c3RlbSBjbG9j
awo+IGFuZCBmdW5jdGlvbmFsIGNsb2NrIG9uIE1lZGlhdGVrIE1UODE5Mi4KPgo+IFNpZ25lZC1v
ZmYtYnk6IENodW4tSmllIENoZW4gPGNodW4tamllLmNoZW5AbWVkaWF0ZWsuY29tPgo+IFJldmll
d2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQoKW3NuaXBdCgo+ICsK
PiArICAtIHwKPiArICAgIG1tc3lzOiBjbG9jay1jb250cm9sbGVyQDE0MDAwMDAwIHsKCm1tc3lz
IGlzIGEgc3lzdGVtIGNvbnRyb2xsZXIgcmF0aGVyIHRoYW4gY2xvY2sgY29udHJvbGxlciwgaXNu
J3QgaXQ/CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiArICAgICAgICBjb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10ODE5Mi1tbXN5cyI7Cj4gKyAgICAgICAgcmVnID0gPDB4MTQwMDAwMDAgMHgxMDAw
PjsKPiArICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47Cj4gKyAgICB9Owo+ICsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
