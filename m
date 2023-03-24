Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B59C6FD20
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 15:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7FyBbkUlSzWUDUg7FSl6pltsSXVFIHYA7e4KXdYYzK0=; b=mcjqFyVNjvV5+vlH3/bbN0AsJE
	+cr+SlV0DuUIsvDy4kptzSQVtzpJ9yVH29BX+UJ8YYR+xWyc+F1UWckBDuy1/GcSM24RNegPLH0kZ
	8aRJdtbHWdx/FCWsaM4kt2fQ3paHMK/6C1G7ApLXUKTADxIalnRj4doToT5Xm+7Av1dSyf4/1Jd89
	4CBBVouch9afktOB4hXp5R3oYcRlT8pfogE8/cVqtQr/K5jJU72PPHsXLaDWnAEW8/EaLUz7n46Zl
	0MYT8bB7Vul83QnUVAh0w/OT4kbRX8GWON6VVyqTGmhZhQb9yQWP2R/OlT5p9wfH9OxZtRkOu2/hz
	oX2tWySA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjRQ-004s6U-1G;
	Fri, 24 Mar 2023 15:34:56 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjRM-004s4w-2h
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Mar 2023 15:34:54 +0000
Received: by mail-qt1-x82c.google.com with SMTP id n2so1839429qtp.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Mar 2023 08:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112; t=1679672091;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7FyBbkUlSzWUDUg7FSl6pltsSXVFIHYA7e4KXdYYzK0=;
        b=MeRC33lk6v1nX1CaLMpuOD7McLymhdBaxID6EIllMJ/odTnOgZ3Ls7Ufy+LF90tZc3
         Rukbh2vhZd09yzD7IbWoKlFToE7vKOFmwn1MlDeyeK2QwZRl3EaVkSQlWGqiEQlqMsp7
         +9v2PHmuFRGG9NieLrA0J6+yO3Y+KmaQ1RDeU1+L6KYByp+SPGdB4x5pwH1MnsWM0ylM
         u8RqbExRZdZwI4k+Yxkf1E1Ncu/Jj4EjQsyS+95WiNCaJHSGdxvcEnqY5rb+M9AJs79D
         Hq3hRsBDyx/SQLzfVXCtTwZyf2mN6bBbx9A8WJIWFxsqFrARC4TK+bTN+cXf/4XHlGwY
         bS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679672091;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7FyBbkUlSzWUDUg7FSl6pltsSXVFIHYA7e4KXdYYzK0=;
        b=44j91o4Cpxo2HWfK9ML1lzBXAAUEV/JyVAfSnrW1LmtVd/wHsO/GCz8F5NY3zmAq9B
         cXQ6Z3ScXgd5XHuELFMdtVRV787PpijDrqa0v6aBx34gakwsB5oSMkx/+iJ3QMmFaFnU
         4FM1vpKiWGJXLPmggU5raJsqAsj0Hbdg7RNnDaZLJZp1mlMhVgLjNiP/n4TKUpudiMFh
         TDdUK98gS9bk3mZJ3F2VVOLe+340aki3xTyVlJ7gGotVTUok/IYTV2NMw0KegweXOast
         IPJJFK46MnKhyyG2psFbUAHw2mjsBWxDk6PcG+XLv6hALkMZ6HIqJix25pp6UgwXUv44
         KVZw==
X-Gm-Message-State: AO0yUKWoC0nFWJyvGVKlbTf4LTlL+YXqDUoLu4qIXEQNwMSw5hEEQQGH
	soO2cPw1RSLF+yXexfbARWNJYQ==
X-Google-Smtp-Source: AK7set/k7jemVRQn2HhZJ/81On3zU02ry4zvQi9KTc7/Sa7tSuj5SNuZNPCX6T0rkNYDxGsmo9XXJQ==
X-Received: by 2002:ac8:5f0b:0:b0:3e1:c341:f618 with SMTP id x11-20020ac85f0b000000b003e1c341f618mr5351655qta.65.1679672091486;
        Fri, 24 Mar 2023 08:34:51 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id h26-20020ac846da000000b003bfb5fd72a7sm12745420qto.86.2023.03.24.08.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:34:51 -0700 (PDT)
Message-ID: <6f2979d33526e5ccdc32cf096415d8309fc91d3d.camel@ndufresne.ca>
Subject: Re: [RFC 2/4] media: videobuf2: Replace bufs array by a list
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
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
Date: Fri, 24 Mar 2023 11:34:48 -0400
In-Reply-To: <68ba7b3f-57f5-3969-5036-2c8d08273548@xs4all.nl>
References: <20230313135916.862852-1-benjamin.gaignard@collabora.com>
	 <20230313135916.862852-3-benjamin.gaignard@collabora.com>
	 <20230313181155.GC22646@pendragon.ideasonboard.com>
	 <86df05244d974416903e919d387a0a0b@AcuMS.aculab.com>
	 <e704b505-86d8-c6f2-8546-adccdab72622@xs4all.nl>
	 <dc04d48e34ed40e58f43badd001a81d0@AcuMS.aculab.com>
	 <cbf34cf1-e065-8136-8344-89ca1864f637@xs4all.nl>
	 <20230319233358.GD20234@pendragon.ideasonboard.com>
	 <f085aa9225c573df906bdc7ff032a8fd591b18b3.camel@ndufresne.ca>
	 <20230322150153.GO20234@pendragon.ideasonboard.com>
	 <2d6480e36ce061a63440d1e11d52b02e57ba746d.camel@ndufresne.ca>
	 <68ba7b3f-57f5-3969-5036-2c8d08273548@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_083452_872768_3870CE2F 
X-CRM114-Status: GOOD (  28.04  )
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

Le vendredi 24 mars 2023 =C3=A0 16:18 +0100, Hans Verkuil a =C3=A9crit=C2=
=A0:
> On 24/03/2023 16:14, Nicolas Dufresne wrote:
> > Le mercredi 22 mars 2023 =C3=A0 17:01 +0200, Laurent Pinchart a =C3=A9c=
rit=C2=A0:
> > > On Wed, Mar 22, 2023 at 10:50:52AM -0400, Nicolas Dufresne wrote:
> > > > Hi Laurent,
> > > >=20
> > > > Le lundi 20 mars 2023 =C3=A0 01:33 +0200, Laurent Pinchart a =C3=A9=
crit=C2=A0:
> > > > > > The typical usage is that applications allocate N buffers with =
the
> > > > > > VIDIOC_REQBUFS ioctl, and in most cases that's all they use.
> > > > >=20
> > > > > Note that once we get DELETE_BUF (or DELETE_BUFS) support I'd lik=
e to
> > > > > encourage applications to use the new API, and deprecate REQBUFS
> > > > > (dropping it isn't on my radar, as it would take forever before n=
o
> > > > > userspace uses it anymore).
> > > >=20
> > > > I was wondering if you can extend on this. I'm worried the count se=
mantic might
> > > > prevent emulating it over create_bufs() ops, but if that works, did=
 you meant to
> > > > emulate it so driver no longer have to implement reqbufs() if they =
have
> > > > create_bufs() ?
> > >=20
> > > For drivers it should be fairly simply, as the reqbufs and create_buf=
s
> > > ioctl handlers should just point to the corresponding videobuf2 helpe=
rs.
> > >=20
> > > What I meant is that I'd like to encourage userspace to use the
> > > VIDIOC_CREATE_BUFS ioctl instead of VIDIOC_REQBUFS.
> > >=20
> >=20
> > I'm not sure what rationale I can give implementer to "encourage" them =
to use a
> > more complex API that needs to copy over the FMT (which has just been s=
et),
> > specially in the initial pre-allocation case. For most, CREATE_BUFS aft=
er SMT
> > will look like a very redundant and counter intuitive thing. Maybe you =
have a
> > more optimistic view on the matter ? Or you have a better idea how we c=
ould give
> > a meaning to having a fmt there on the initial case where the allocatio=
n matches
> > the queue FMT ?
>=20
> I wouldn't mind if we can make a much nicer CREATE_BUFS variant with just=
 the
> size instead of a format. That was in hindsight a really bad idea, terrib=
le
> over-engineering.

Note that all DRM allocators also includes width/height and some format rel=
ated
info (or the full info). This is because the driver deals with the alignmen=
t
requirements. In some use cases (I have inter frame dynamic control in mind
here) the fmt could be a mean to feedback the alignment (like bytesperline)=
 back
to the application where the stream is no longer homogeneous on the FMT.

That being said, If we move toward a size base allocator API, we could also=
 just
point back to an existing HEAP (or export an new heap if none are valid). A=
nd
define the sizeimage(s) is now that information you need from the FMT to
allocate anything + which heap needs to be used for the current setup.

Nicolas

>=20
> Regards,
>=20
> 	Hans


