Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F4DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 07:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iwrZONwoRSfjb0wCs81MO2GDpfimkrDRgIDZYdwpVz8=; b=PBv4hhPCNKdShl
	FUWVeDT7zWuzIY2MfCa1JpPkHR1Lc9mOUzL8/HnErrGVSsjnyd2qtKDsmAL/kAEV1whlTkWSIhAEk
	xUcWANxDchponq2cdjzSwXoC60Hw/rgjvb2AsUsReqSQq78+H10j3Nxu7UBnn423eSDhTmxHnQ6XV
	tQNw3YyVgjQxkEsAVMU8hUyMjtdMsRhjNwx1Z6DHWS/x+h6fuZ4YmFEDSatg3A7lmz2cES+Dx8HJZ
	nJPxik+7lyz1Nc2Mt83gokxzIgb+LDLkJmPdBdilj8LOUu4ZfLewoUwUcTSBm3CO8Gc3QIq6Yw/Od
	xME6+iHds7zuuunFZUlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXIAG-00Fyfl-CV; Thu, 24 Mar 2022 07:45:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXIA4-00Fyc3-F6; Thu, 24 Mar 2022 07:45:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13725B821FA;
 Thu, 24 Mar 2022 07:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EDB3C340EC;
 Thu, 24 Mar 2022 07:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648107933;
 bh=p8qcVNPM2qOW9EQx6XQFqzBj4GCexX5/KhXigTDY4CM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GkCctxK1ampcX4CHpJBsPTacJaKiSiD9/RE/8CD2xKcHSV/q0mM5WmjaEUhZc34qZ
 ZCNKp0AvyjR1swsxhK1oo+cKNBSfvyoeptu2eWERG+T3W0+lF8HxXxjWgHC5czisUK
 +VT/r0C2HyXF4wZwjyplE/43W/5OFZ6WYDogbHFQ+DathtKjpeSv0sfmBdV5De6471
 UTNm9aNRn6LEumumovVAKNSF83sQn5uUJUVjR+6ucDrdQvCQZeJmM8/WsmmonQ2aze
 U966/qim2RMx/7+bnPat763Lx5fHgddm4MsFNLhdQTll/Yk6c+Dex+W5SZDW2upnKh
 jSGpRXYWBE81A==
Date: Thu, 24 Mar 2022 15:45:29 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aaronyu@google.com,
 angelogioacchino.delregno@collabora.com, miles.chen@mediatek.com,
 yc.hung@mediatek.com
Subject: Re: [PATCH v4 5/6] ASoC: mediatek: mt8195: add machine support for
 max98390 and rt5682
Message-ID: <Yjwhmacdw+birt0/@google.com>
References: <20220324053851.27350-1-trevor.wu@mediatek.com>
 <20220324053851.27350-6-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220324053851.27350-6-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_004536_682244_692666A5 
X-CRM114-Status: GOOD (  10.31  )
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

On Thu, Mar 24, 2022 at 01:38:50PM +0800, Trevor Wu wrote:
> This patch adds support for mt8195 board with mt6359, max98390 and
> rt5682.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
