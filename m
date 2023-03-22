Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF50FC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 14:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqEwR0mnH2dQTWES7qcpZxyDU3kIdJJrQjcIfcIfUws=; b=PRPGU673hN6AG+XE8QgxNO1Q3Z
	2ciiAmfZy1Hx/snWVZcKCERoTr9ybIywe8KwLeNWwV7BjoErEVJ+BH/N9ah07xk8lTgmiFATT+2Q0
	gXxjEgYDZQhVqU5skMLDWZvPfTJfCg111SjDLu+sD0hP/uHnikhzAdp2aWl2LRqWWy8kRElJYTmck
	y2pI8dpxX8B1RGTDhBlfdXKlBqghTvGCYSHv0ka3oAM/Nihj/XN5OiVpguKS+0IwxPSMOhk/1XR7Z
	M+dW12LBmxr5RINIelQkM4THyO6pmMhJFyJgpQ9fkzrMvZtx+Z9+QTEWHFNa2bFe89dYVmpIAb7TV
	iHFo+3Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pezns-00GNQZ-2E;
	Wed, 22 Mar 2023 14:51:04 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peznm-00GNNS-1W
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Mar 2023 14:51:00 +0000
Received: by mail-qt1-x835.google.com with SMTP id hf2so18724597qtb.3
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Mar 2023 07:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112; t=1679496655;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xqEwR0mnH2dQTWES7qcpZxyDU3kIdJJrQjcIfcIfUws=;
        b=4mDo4UpOGVHUWLxUshM4Dz9N05BjdMLZQ56BMssgs0qciRkedoa4RVR4EJUVB3FRjs
         Ve7/uD241dSYiTmpXtZO/ZPzqSqxEq1/dEWNWiCFmglU4N115xERZS8mj66G1g44ObEU
         DUXgol5g66ixnMBg57YAmEiwVV5RMg8nWH9LyC9QJfrkVJZnspc3wbP4ekuFLLG990eZ
         p0dt1wZDF0FDDJHO6VuJnmTyVBSfbRBkRPEWGQawc0zvjyxupCmql6MVg/fw3DeJxUwp
         6EoMlWZn20w7yUhUSWMybVMwQUzOlI3RCagsvYnUA360+1fl0qLv0KXrHwazDroI58FA
         Cilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679496655;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xqEwR0mnH2dQTWES7qcpZxyDU3kIdJJrQjcIfcIfUws=;
        b=TqBAIZqOoRroym6jx22ng/esQugQSNyoW0skfNpMt0t9MMZCTSJegJTf5BJI8vNLSo
         rE8ZhOTRcfZAFCZIUME1uFAIiubUZ5zBMpyqzAePtczoFRXIQxOBSgnDaqtpYxk0DRVD
         Hm+cyCoalIkoK5f3ffYrxh4saebeg0dpZGFaYBQ9xJDMJ6KT47j1VMK1M39SW3VzOuDA
         xl1Z+nRX9KZnqkeNW+FM8zDDsNllkMxD2pPPcRXWQzS5xRsoXx3ayraJako3zIi8yHMB
         1k2Ivq40eXMp9d4JPqo+ifOIakgcuE36ZSgFo7eK8SJwAM9XQCfdVSzpf/+68C6kfg8q
         XxvQ==
X-Gm-Message-State: AO0yUKVJoWDBPldF3NjT4F8NU98HgUg6YWVxw9hv4kUjqc7pTQcKeBxU
	iLCiXBTMHnGd34KZy/UH7VPc2Q==
X-Google-Smtp-Source: AK7set+olGnH2L8HiH8wu79IhsPwiTafG3zfFFddwhNxvuWfFc+q5aG+tjjynN8ff7zGF9L/LuK8og==
X-Received: by 2002:a05:622a:4d2:b0:3bf:e471:69a3 with SMTP id q18-20020a05622a04d200b003bfe47169a3mr6127461qtx.65.1679496655113;
        Wed, 22 Mar 2023 07:50:55 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id 69-20020a370c48000000b00746777fd176sm5025558qkm.26.2023.03.22.07.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:50:54 -0700 (PDT)
Message-ID: <f085aa9225c573df906bdc7ff032a8fd591b18b3.camel@ndufresne.ca>
Subject: Re: [RFC 2/4] media: videobuf2: Replace bufs array by a list
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil
	 <hverkuil-cisco@xs4all.nl>
Cc: David Laight <David.Laight@ACULAB.COM>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, "tfiga@chromium.org"
 <tfiga@chromium.org>,  "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
 "ming.qian@nxp.com" <ming.qian@nxp.com>, "shijie.qin@nxp.com"
 <shijie.qin@nxp.com>,  "eagle.zhou@nxp.com" <eagle.zhou@nxp.com>,
 "bin.liu@mediatek.com" <bin.liu@mediatek.com>,  "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "tiffany.lin@mediatek.com"
 <tiffany.lin@mediatek.com>, "andrew-ct.chen@mediatek.com"
 <andrew-ct.chen@mediatek.com>, "yunfei.dong@mediatek.com"
 <yunfei.dong@mediatek.com>, "stanimir.k.varbanov@gmail.com"
 <stanimir.k.varbanov@gmail.com>, "quic_vgarodia@quicinc.com"
 <quic_vgarodia@quicinc.com>, "agross@kernel.org" <agross@kernel.org>, 
 "andersson@kernel.org" <andersson@kernel.org>, "konrad.dybcio@linaro.org"
 <konrad.dybcio@linaro.org>,  "ezequiel@vanguardiasur.com.ar"
 <ezequiel@vanguardiasur.com.ar>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "daniel.almeida@collabora.com"
 <daniel.almeida@collabora.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "kernel@collabora.com" <kernel@collabora.com>
Date: Wed, 22 Mar 2023 10:50:52 -0400
In-Reply-To: <20230319233358.GD20234@pendragon.ideasonboard.com>
References: <20230313135916.862852-1-benjamin.gaignard@collabora.com>
	 <20230313135916.862852-3-benjamin.gaignard@collabora.com>
	 <20230313181155.GC22646@pendragon.ideasonboard.com>
	 <86df05244d974416903e919d387a0a0b@AcuMS.aculab.com>
	 <e704b505-86d8-c6f2-8546-adccdab72622@xs4all.nl>
	 <dc04d48e34ed40e58f43badd001a81d0@AcuMS.aculab.com>
	 <cbf34cf1-e065-8136-8344-89ca1864f637@xs4all.nl>
	 <20230319233358.GD20234@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_075058_579417_0D3F7287 
X-CRM114-Status: GOOD (  10.53  )
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

Hi Laurent,

Le lundi 20 mars 2023 =C3=A0 01:33 +0200, Laurent Pinchart a =C3=A9crit=C2=
=A0:
> > The typical usage is that applications allocate N buffers with the
> > VIDIOC_REQBUFS ioctl, and in most cases that's all they use.
>=20
> Note that once we get DELETE_BUF (or DELETE_BUFS) support I'd like to
> encourage applications to use the new API, and deprecate REQBUFS
> (dropping it isn't on my radar, as it would take forever before no
> userspace uses it anymore).

I was wondering if you can extend on this. I'm worried the count semantic m=
ight
prevent emulating it over create_bufs() ops, but if that works, did you mea=
nt to
emulate it so driver no longer have to implement reqbufs() if they have
create_bufs() ?

Nicolas

