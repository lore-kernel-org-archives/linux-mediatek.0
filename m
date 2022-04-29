Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF82C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 10:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6eWNEuRbghvxaBwAsmJt0QHrn9DN2D+/fFXirUu6r2g=; b=zaCwuYiH5hIEqp
	ageV4nUWnjUziFifLG3hvRAyH5zJfVM8wQe49Ip67nM73bJPN7kxYQgXTYhyWAvSw+Q04F67Kd+Qg
	ZWSRrkGzVkvQW8dted0n9wDM4yPp/7Tw2/VNNo/bcK+ZBGm3x4SVW4YdUg2R7tpf7v79PHVUbFYTa
	iI4tmXlvte81usEgLf3eThuR7RUSc35Vyn9psfrySOjMjNg8h2uXE786EWOFIIXus/QM4zJLV1S2v
	+rEKTwlNsb+WIkJb62SdcIaMJRRtRPpQr6+jzc4nTOPQ8jGJG2v5qIQVhWIhwQVxCsX7h7MTYYH9O
	P9mdHnHZv/aNxbZdGfzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkNi1-00Ai8i-MS; Fri, 29 Apr 2022 10:18:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkNWd-00Acpm-Nd; Fri, 29 Apr 2022 10:07:01 +0000
X-UUID: 85f0b2c8ff4345c3b928de20fef5286a-20220429
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BpSO7p/Y6ou99hdrm2O+pLFgugxUvxdwgR7iSmB1H1I=; 
 b=PSo1s33n79dzV7ssi62NucCThVDnqrxO7sV21r1txAl/3PCIFtYPGa7SxwWPuJUJxePH/vkIn9WcS/h1IIxgqocqZ1gqFot/2vHFZYhJ5gp6DqdUFknhuJl8z8Hlgkw16ztV5kqNWqKrwyKnVkQlzPBxlpYGwEcuBnC5mG+77Ng=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:91722d89-764c-4260-85db-1e8d82751376, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:7c1f2e2f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 85f0b2c8ff4345c3b928de20fef5286a-20220429
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 866637072; Fri, 29 Apr 2022 03:06:47 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 02:56:45 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 29 Apr 2022 17:56:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Apr 2022 17:56:43 +0800
Message-ID: <2930dbe4b9e445e5d3d33a0c94fdd44d9eebae96.camel@mediatek.com>
Subject: Re: [v4 07/18] ASoC: mediatek: mt8186: support i2s in platform driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: <robh+dt@kernel.org>, <angelogioacchino.delregno@collabora.com>,
 <aaronyu@google.com>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>,
 <tzungbi@google.com>, <julianbraha@gmail.com>, <alsa-devel@alsa-project.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 29 Apr 2022 17:56:43 +0800
In-Reply-To: <YmqE+80xyBoIJvto@sirena.org.uk>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-8-jiaxin.yu@mediatek.com>
 <YmqE+80xyBoIJvto@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_030659_842303_91BA262F 
X-CRM114-Status: GOOD (  16.79  )
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

On Thu, 2022-04-28 at 13:13 +0100, Mark Brown wrote:
> On Thu, Apr 28, 2022 at 05:33:44PM +0800, Jiaxin Yu wrote:
> 
> > +/* clock source control */
> > +static const char * const mt8186_i2s_src_str[] = {
> > +	"Master", "Slave"
> > +};
> > +
> > +static const struct soc_enum mt8186_i2s_src_enum[] = {
> > +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mt8186_i2s_src_str),
> > +			    mt8186_i2s_src_str),
> > +};
> 
> Not clear why this is user visible?  Shouldn't the machine driver be
> setting this.  Also please use more modern provider/consumer
> terminology
> for the clocking.
> 
Sorry, here are the controls left by debug, I should remove them.
Yes, I should use provider/consumer terminology for the clocking, just
link the SND_SOC_DAIFMT_CBP_CFC.

> > +static int mt8186_i2s_hd_set(struct snd_kcontrol *kcontrol,
> > +			     struct snd_ctl_elem_value *ucontrol)
> > +{
> > +		return -EINVAL;
> > +	}
> > +
> > +	i2s_priv->low_jitter_en = hd_en;
> > +
> > +	return 0;
> > +}
> 
> Same issue as on the other patch with the events - like I said there
> mixer-test will find a bunch of these issues for you.
Yes, I remember it.
Next I will continue to use mixer-test to check all of the mixer
controls.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
