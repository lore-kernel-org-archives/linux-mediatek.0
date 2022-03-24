Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FD2C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 05:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ej/hgC2YZ9myDNLBEx9BamC/4Ixdd2G4FoKl45T3pNk=; b=d5n9otgHeqGgor
	pDCvRbH9meutCGhs9do16IHR6FlQ97AYPaaGjBUM1VFcwdkj9AlHprEgvmzcnINSPfzet9DOB64dG
	oU6n5nE8a8UsKdc6cg8NHhJSjmjP5XICXE1nR8fxcdrZRqgStCMDHZAbwai25eL9fcAZ6d5UJLcts
	st89h7lqT8fpW7Pg9yax229LaEp7DvbA+58VY1aa6JqwbluRp47DBJPQyjB1G1BYrG3OzklUczpN/
	3/85kO2/8xyxbnsbS07LEbZSern3LOotjVYcClkreteiOhEADnbHKsL43Gpf2hIC81Ttqw96+wE1C
	3umtWHE93tIX0WB+RINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXGA0-00FeI8-G1; Thu, 24 Mar 2022 05:37:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXG9o-00FeGn-NJ; Thu, 24 Mar 2022 05:37:14 +0000
X-UUID: 844cbb8e7dc942d09bed1f832a55cb63-20220323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LkBEjuwb4kFm42RaaeGTETdqNBH+iCKTK2CzsPeo/Cc=; 
 b=JVLMd+pmhdFdymnaKtvYMseBSlXLbdjQZ9uyMx5EN9yi83OKUh4uZ7sybHVlp0FkIbHdXeMLwsY6qi8RGXzoP+hLpCC7aSPBrj2nTgVAoUw+4fEN4aGe2FdsD5Z5stFsR5MV3TLAjcnUE/O8qb9iSiSC4WsLkgNz2agYJj5hKl8=;
X-UUID: 844cbb8e7dc942d09bed1f832a55cb63-20220323
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1027610243; Wed, 23 Mar 2022 22:37:07 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 22:31:06 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Mar 2022 13:31:05 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Mar 2022 13:31:04 +0800
Message-ID: <6c331bb8e95aa7c1a88a6161622f51ff2fee3f98.camel@mediatek.com>
Subject: Re: [v6 1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible
 and new properties
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
CC: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <angelogioacchino.delregno@collabora.com>, <aaronyu@google.com>,
 <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, <linmq006@gmail.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 24 Mar 2022 13:31:04 +0800
In-Reply-To: <YjvBLf/8M1WUS/L+@google.com>
References: <20220323164442.921-1-jiaxin.yu@mediatek.com>
 <20220323164442.921-2-jiaxin.yu@mediatek.com> <YjvBLf/8M1WUS/L+@google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_223712_793922_6E5F588A 
X-CRM114-Status: GOOD (  11.70  )
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

On Thu, 2022-03-24 at 08:54 +0800, Tzung-Bi Shih wrote:
> On Thu, Mar 24, 2022 at 12:44:39AM +0800, Jiaxin Yu wrote:
> > +  speaker-codec:
> 
> If it is possible to have 1 or more items, would "speaker-codecs" be
> a better
> name?

Hi Tzung-Bi,

Yes, it is better to use "speaker-codecs", I will change it that in
driver patch and bindings patch.

Jiaxin.Yu
Thanks
> 
> > +    type: object
> > +    properties:
> > +      sound-dai:
> > +        minItems: 2
> 
> It should be 1.  Consider of rt1015p case.

Yes, I will correct it.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
