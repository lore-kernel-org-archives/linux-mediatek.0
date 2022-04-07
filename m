Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5E8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 00:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGtn4iIjEYSWcRa3kroTVywHDqcN6LIfYsWy67M3GNs=; b=JENWiBuUeQkNIj
	KjDQ3iVPpbXAPjP6Fb/q32b2hdTXL9mmYvLQ2CfwvnPswXOejx5E923eBFA3ARPIgaOguCTHD9qMM
	BUi1gWoXmc0S5Jp5VQ88a3VXdWA3aOdp+B+kgDFVoGo1rrqs/lO1OaEdviTfkSnVYz+Gm06AaO7QI
	DzwVirDFcN677ctm1mTnT2YRNpPStPy2D0GpKwTjuoOLeq9FYU1C2rqDMAwooTbv+1Fg/9mJqsKUo
	GNh/fsCDmT4tOxmf8DrMQJqaw0GYgZOulhPlWj2vdfrwsJBpYQ9pqVkd/a9ehmpnNw7DPAboBXxj1
	4CK0CTldCZH8tzRRt0mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncGS7-008SSO-Kg; Thu, 07 Apr 2022 00:56:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncGRw-008SQ3-EW; Thu, 07 Apr 2022 00:56:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DD33AB81E4E;
 Thu,  7 Apr 2022 00:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC90C385A3;
 Thu,  7 Apr 2022 00:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649292993;
 bh=Xy8Cf+XOsCMJS3zqWOHPAsptjXbizJteN5uf2mtD8SI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u/NP4XCYxnKR/NalBRnfLkM/AJVcg2nyj5fYgQbFmk1Qrs7IVRMsA6vzxAQ5xTW/Y
 WiIxkBssB90B65WU/GOX9TeYNSX1hIqWmlVamDSh3qmCAyp1g/jHZNArymA9tiPLu5
 o/1xzrHbeQ6S2YIX7MuKOcEcbsKOiFIKLN+Gh9Q2S1ujZq+FwqyMEP/9yxkZ1IlOIF
 dJujodSyADUe0RPCuFbHEMexeZk6MXaHNUO4j0o3WljwCYv/G95EhchO0gPAV2p5fp
 ziclcxhSYKQ5Fyld8zuLAGXQSnB8j32ArLZXOtk994cNya8tySUMtjgTHHKaCEjFsH
 DF5Y7gPe9VqpQ==
Date: Thu, 7 Apr 2022 00:56:29 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, robh+dt@kernel.org, nfraprado@collabora.com,
 angelogioacchino.delregno@collabora.com, aaronyu@google.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, linmq006@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v9 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <Yk42vX7gSZp9l8yW@google.com>
References: <20220406100514.11269-1-jiaxin.yu@mediatek.com>
 <20220406100514.11269-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220406100514.11269-3-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_175636_664716_65327F85 
X-CRM114-Status: UNSURE (   9.49  )
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

On Wed, Apr 06, 2022 at 06:05:12PM +0800, Jiaxin Yu wrote:
> MT8192 platform will use rt1015 or rt1015p codec, so through the
> snd_soc_of_get_dai_link_codecs() to complete the configuration
> of dai_link's codecs.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
