Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19130C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 15:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SUE7zrBT371aslzzeZG9KeMU/YHn1LU9Sf1q8vcMRyo=; b=Rd+K95AqssCNYc
	GAtUkEOo/aHJdNGHttoyDgzXOFKqwNZmu4flQ59byWdnAv39UAkPLWV5CxvyHVZbt7Yqeyq2TPIDf
	vNbhmfjtfw0QeXES/r95VQ0r8egfk4+1Sh3lLLojZO8FfFb1/8t+37FcdDPj4ilXO9OY/75CB0JzM
	lmmzzGrprRnSLPE/I3d2QheKr2QWHZXSRCgjs33SW7ZzKFUmTIPGlSXTY5GIHAFLaL5E8AZKPcn6I
	8GMkZfVl/KvgU8NDDXTHt+tzDXheBRRZuNWgCqKs620fmsEP1frPfa5DWM6QLIm0mhDVf3Z/DPo6X
	fwM+xWCWKNLzI+uHSjew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWJi6-0087WE-Nx; Mon, 21 Mar 2022 15:12:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWJhu-0087RG-JG; Mon, 21 Mar 2022 15:12:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 340F7B8170A;
 Mon, 21 Mar 2022 15:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19D8C340E8;
 Mon, 21 Mar 2022 15:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647875547;
 bh=9Y12UFEf0Mf9nHunCW2p4Tl8F6I/gFgWOZD/wYfYOMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RiriLh88bvOpCG0mZJ+XfNYOghNqemH6z0HFKHjpn01CIZL/8uy+fBu3RL2yZ/DeF
 eTvaFEST5+o9GuwG+/3fLNQMcCBLr0QnRiknPKr6YO6N/KUFRqGcuEmD2G3AFDLFXb
 b1A+5kJX6i2qDaa/J6EsuhGCfiWarZKgshXRXuZAzbioZMKnhryUdH14Kd8Sekcoqf
 wpJoFWDsQKMOmn0qTiSBbBHUTp3CHAQS7pBwsy/it0aq3Hwh/of1ahxnzo/+8jDEzq
 mOFsqnVuGbkbc6bT6JmC5XNEYsNSmuiVx0e6ypoJsd9ZaNQZkNw2V+UrJd8T8tT1qA
 35UMMnX5ChagA==
Date: Mon, 21 Mar 2022 23:12:23 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aaronyu@google.com,
 angelogioacchino.delregno@collabora.com, yc.hung@mediatek.com
Subject: Re: [PATCH v3 4/6] ASoC: mediatek: mt8195: rename card controls
Message-ID: <YjiV18IjpPMZrwvB@google.com>
References: <20220321072312.14972-1-trevor.wu@mediatek.com>
 <20220321072312.14972-5-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321072312.14972-5-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_081230_834775_B7A12F43 
X-CRM114-Status: UNSURE (   9.16  )
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

On Mon, Mar 21, 2022 at 03:23:10PM +0800, Trevor Wu wrote:
> In order to be able to reuse the same configurations in user space,
> rename the controls to generic names.
> 
> "Headphone Jack" -> "Headphone"
> "Speakers" -> "Ext Spk"
> "Left Speaker" -> "Left Spk"
> "Right Speaker" -> "Right SPk"
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
