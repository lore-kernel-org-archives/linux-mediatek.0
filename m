Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB32C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/aMRHf/4eReRtsK4I2Zpf05b7u4Pn1sMEe+a9cAYmxw=; b=PriT2JqL2gu99o
	DzN/HT/3NpGAFROxxZ3sXJn1hQ4VS0V2BSkU4/5ND9xFKMObHYQRjLj0wZArrgy9FUTEoQN9oXlzC
	FS2n/4n+syJuLkw4Lnuz164wBZT/lOFlh9oslQBhGTO8qJxVv+n+0/wqowVFPIIYgzgmpWxTOKX6B
	aEAbtnNJLYc4qsV2enXfhqkc63fK1IXsN8tltl122EbRp/ry5JChBaaIJ1NduiIpeATmWzis/x4QG
	1z2/lLXbXWsQSohEHtVFyB/5paIUuJpW+MEUNvOraZ2m/x74gTqJ8MocRRxtvtWbvULOUTnrhdpN4
	EP/D/66XZGJGBexBp3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZayY-00GncH-3e; Wed, 30 Mar 2022 16:15:14 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZayL-00GnYf-Ee; Wed, 30 Mar 2022 16:15:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 16E381F45D79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648656899;
 bh=b0AyqVB1oKTLJHMRCRnyV2JQz3E+jsXsvdxPFkQuRVY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IkXp7YLLbwEGMTNIGKu1Wmcyn3FrmqCJymAolDdizOH0Qi3JJeAiLJVh30Xbqrx0O
 CCWbxYSfWhivoN2A/vo91tfKEKTi5hb/q0rQlfsjVEINng46NNfyM494yLZgFp+T6q
 ymuAwSZiWjhDFZL1WmgedlIsNpBRl3Xz9WMKM/IGmzY+zbh32fqAO7I7oBskvbdNcY
 kt8d/YcpEDu8aQUM8Nm+mULHgyKhiiKyW+5nlZWI8rQwHXIeOcnUUloQ595W+RCwg+
 sjpK5RZGKg9/71NcL40P5FBueF6GX6anecvM+GcMPpTCk8eiDGb8GiygmOy/nqjPut
 KfUPnV2Y0wb1A==
Date: Wed, 30 Mar 2022 12:14:50 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, robh+dt@kernel.org, tzungbi@google.com,
 angelogioacchino.delregno@collabora.com, aaronyu@google.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, linmq006@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [v7 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <20220330161450.xxak64el6g6lzcem@notapiano>
References: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
 <20220324064511.10665-3-jiaxin.yu@mediatek.com>
 <20220329223002.uo7kiemopkh7ak4x@notapiano>
 <dee3fbb7c9f0c3e1f11143db1d6fc4381cab827f.camel@mediatek.com>
 <YkRNSoBKFvYYyZLu@sirena.org.uk>
 <61e9fb59448837cfc8e3ec862b711294bcb68872.camel@mediatek.com>
 <YkRoC30JLDMeVi1B@sirena.org.uk>
 <734fbf254c64668856e987aafe9d7dfd3ec86941.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <734fbf254c64668856e987aafe9d7dfd3ec86941.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_091501_702878_DB6DE74E 
X-CRM114-Status: GOOD (  28.06  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 30, 2022 at 11:48:01PM +0800, Jiaxin Yu wrote:
> On Wed, 2022-03-30 at 15:24 +0100, Mark Brown wrote:
> > On Wed, Mar 30, 2022 at 10:06:24PM +0800, Jiaxin Yu wrote:
> > > On Wed, 2022-03-30 at 13:30 +0100, Mark Brown wrote:
> > > > Making a previously optional property required means that systems
> > > > that
> > > > previously worked may stop working unless they update their DT,
> > > > DTs
> > > > may
> > > > be distributed separately to the kernel and perhaps even baked
> > > > into
> > > > firmware or similar.
> > > Thank you for your detailed answer. I should keep the driver's
> > > behavior
> > > consistent with the description of dt-bindings. The "mediatek,hdmi-
> > > codec" needs to be set as the required property. Is my
> > > understanding
> > > right?
> > =

> > The binding document and code should match so if one is changed the
> > other needs to be changed too.
> > =

> > In theory we should never change a previously optional property to
> > required which would mean that the code should be updated to reflect
> > the
> > binding document, however sometimes the DT isn't actually used as a
> > stable intereface by anything for a given property or device type so
> > we
> > can get away with changing things.
> =

> "however sometimes the DT isn't actually used as a stable intereface by
> anything for a given property or device type so we can get away with
> changing things."
> =

> Sorry, I don't understand the real idea of this description. Does it
> mean that dt-bindings in this series don't need to be updated, but the
> driver?

He means that usually the DT (and dt-binding) shouldn't be changed to avoid
incompatibilities, but sometimes it's OK to change them. For example if the=
re
are no users of the DT yet.

But in any case, like I mentioned in my latest reply [1], I don't think cha=
nging
the dt-binding is the proper solution in this case. The driver should be ch=
anged
instead.

Thanks,
N=EDcolas

[1] https://lore.kernel.org/all/20220330152026.6nuigsldx46lue44@notapiano

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
