Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2055C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 16:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLDu3L+pNM243u/I/C+s/d41tC6RYCmf/OUHhfmhNqY=; b=I81KSj8iI1H93r
	lFApC31/bnQurGH+VyRIgdxV1L7G06u924yPNI2pb35aCLSP6fnDywDaqYPcT9Rfzv/AcmrcvrMfC
	0QEhoQbi0hg20c1Qw7iSlsQUFASFyC2XHD23d1zHIGaDvPfpHSCF8bzU//LfE5aAE9HIOLdI9DOcd
	DT2dxfqEuvo1WdJfeZm0QrG+RKo+pH+Eraxm/kS6o8w/GGJ4nHvPEg5hmHO4KYZVE5eA1KJa3CN4w
	JTrcRjwJUufj/oql3m0XFwbQxeBS8EeCIecTvczOemO6yhuPmG47tKpXb90qgasoqmqNwlamMFeZD
	kvVXL4v38mKI2T8YcLqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXQ3y-00HA5W-No; Thu, 24 Mar 2022 16:11:50 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXQ3l-00HA10-F7; Thu, 24 Mar 2022 16:11:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9C9361F4588F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648138296;
 bh=NQIbmrCja9vafgXukwQnvA7dnbY+ovzFjWjQXecy4AA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dqy5Fb7iHQn86liK/eKe2su/+aDIi7weA2TyPNWDCh4TZxEia+Au+iB3QA+0knXHi
 v9OC54dzY/aJgT6k4wUUZQRLXnmamQ5avMGrgRYovcncTBspQ4dmWC2HMFM34N7AEs
 OXsgPqUsSdJUP/1lIy2oAWDMY4x8IQ1YDWXolT8zmUDr5CkTelhIE5hHXoz2iZvo8o
 jMBiic0OQg5fCjbxd/eOVOsET3iqnD+84AgDRMw0kOIFUQcVDVdhkRMsnSvUi8eJeY
 tdb7LSDKooX8fWK3OqhJHV9tbIlD3j19t7twPEQpNpWNxPbMU/EeFjuJaMTMLQh7m8
 QNeahEts2FRYQ==
Message-ID: <9268bdf3-d1f2-b308-48ca-078f10dede31@collabora.com>
Date: Thu, 24 Mar 2022 17:11:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 1/6] ASoC: mediatek: mt8195: revise
 mt8195-mt6359-rt1019-rt5682.c
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aaronyu@google.com, tzungbi@google.com,
 miles.chen@mediatek.com, yc.hung@mediatek.com
References: <20220324053851.27350-1-trevor.wu@mediatek.com>
 <20220324053851.27350-2-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220324053851.27350-2-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_091137_676177_2BE5AD0E 
X-CRM114-Status: UNSURE (   9.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 24/03/22 06:38, Trevor Wu ha scritto:
> Revise driver for the coming driver combination.
> There are two major parts including in the patch.
> 1. Apply some suggested changes used in mt8195-mt6359-rt1011-rt5682.c.
> 2. Reorder the layout for centralizing the codec related code.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
