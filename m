Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46833C6FA81
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 04:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/qxywixk7Je4QAulmTspgqKqxl2g8Y8PGMTJqOATZw=; b=aeB2h7YpgISEjSU8hZeIx09jQt
	tx+C6TaG52nvFrS6i28tRJCZqYGMJiWeldB7ZX0hgt3bJrB0SxcAm1Fgj0+kLByydP0Pelr2qZ4Vg
	rjOKEwM3LJvKbCWUHmT40bVLP1WDiXwVtk1mxTNJ9TFqrBSBHqJkne2MG0DAOuhkFgKzWf2Aez/Iu
	gbz73vjtW+YWq/scWer9CO3hBJrP4ENnFgBMhQjUW4lAY5wZ+BFx7qRF9QqN5BkWOw4Xfl0VOTs1w
	wCZc5IWbjmX/dY1F0BLlaSLz+Mek23gVuAyJkfQ0cldSmz7QgkAtzlBbXRIYNmW39BFPRPF1+ZH9U
	wsLuabdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTyIO-0009Ux-Sz; Fri, 02 Sep 2022 04:28:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTyIL-0009RC-1N; Fri, 02 Sep 2022 04:28:42 +0000
X-UUID: 5472c648d9c341c7a5691bba8185200c-20220901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=k/qxywixk7Je4QAulmTspgqKqxl2g8Y8PGMTJqOATZw=;
	b=E5oopIo3fh9cayLq8TE1Q4G88WoK1j+8eoo1bc8iAZ3ppHaKuDbbQXGzEUtZA5HlE6F28lnr14LUvk9EGFSkUlm6gwuJmjJDJYDu8ujpijrkmOlwt9kofrNiWUZZVvCotm5369ZqK0XyYXHlWXJTBZtdCWw5t0uGE9EKVCgJSvw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:3f22b081-214f-44bb-810e-3254d42fd8bb,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:2,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-3
X-CID-META: VersionHash:84eae18,CLOUDID:7a1968d0-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5472c648d9c341c7a5691bba8185200c-20220901
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1552023613; Thu, 01 Sep 2022 21:23:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 2 Sep 2022 11:53:17 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 2 Sep 2022 11:53:16 +0800
Message-ID: <8bc2ac6c1cd18431d2fad50673e39474e5b87149.camel@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: media: mediatek-jpeg-encoder: Add
 MT8188 compatible string
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, "Krzysztof Kozlowski"
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 2 Sep 2022 11:53:16 +0800
In-Reply-To: <d506a523-6638-78f3-6a7d-2d9312302403@linaro.org>
References: <20220719100214.2096-1-jianhua.lin@mediatek.com>
	 <20220719100214.2096-2-jianhua.lin@mediatek.com>
	 <d506a523-6638-78f3-6a7d-2d9312302403@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_212841_089783_DD56A4F3 
X-CRM114-Status: GOOD (  13.66  )
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

Hi Hans Verkuil,

Gentle ping for this patch, if there is anything I need to modify,
please kindly let me know.

Thanks.

On Wed, 2022-07-20 at 08:28 +0200, Krzysztof Kozlowski wrote:
> On 19/07/2022 12:02, Jianhua Lin wrote:
> > Add compatible for MT8188 jpeg encoder.
> > 
> > Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> > ---
> >  .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml         | 
> > 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> Best regards,
> Krzysztof


