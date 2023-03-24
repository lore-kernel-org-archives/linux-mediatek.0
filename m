Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E336C6FD20
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 15:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlgJl6q6nmXLwoducihQkeA4VjkQWrKTU/XpmLER5K8=; b=rR8+sxdyt1+pXsQvHcq33yXtb0
	d5T1vjsUplU9m3yd6MPVp2fgGh74IkXqZAwac5veXF+YQs5cxeOScbE47rnCI/txwhsx+BWNjw8CS
	eeBtV+dTo83Knl8P2iVnGU+7bZUaJbOzIjLagixFydKI+7Ukqgm6LfiSn1yK+Sv5jliJzOkiHK2kM
	86q1t0rgXm4cn273Mnr1vHEyIEeWiWh/LkVWugncgBl66ZcCtKychmPm7uNNELILDDYXP5/0MFwyA
	a1uPxW7Tgu/BOVCgAJSA3A73h12Tu82PuLolA5iThTnF5RH9Z/pJy+vE/vrvz/LTuC8tr+eyS1WWZ
	2cXZAZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfj89-004nie-2N;
	Fri, 24 Mar 2023 15:15:01 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfj85-004ne3-1h
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Mar 2023 15:15:00 +0000
Received: by mail-qt1-x82a.google.com with SMTP id s12so1726491qtq.11
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Mar 2023 08:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112; t=1679670894;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BlgJl6q6nmXLwoducihQkeA4VjkQWrKTU/XpmLER5K8=;
        b=QAEyb3y2Vs1mSwY136+bu6SS016Otbf3KKfs9Mlyynm1gBzKn8IBg7DKKBORGVgyRL
         Wz6AisMNEwAkdbvXM7zJ93PyYVnHMRLt+SqV2+KIzgZGBKfSEA/SvYbGi1DbKwG8+t3X
         EnXZZz4q60ZBfI96mKWDnSZ2+1OtBHBRk9yySy0hupZdJ1YJ07CTHjT6hQzPp0un5Zi4
         ZMc2Z4n2f2EN3LAB+6ExoNkdtMUvrlZM9biFAE3RvcusV/CPEzZ0QodUUN6PBVj+S7q1
         VeHHAUt7o/Jx+ffoh+LeHf8+aj5khtrxdEJIKejig4N0viMRuvBtbR/GYyPRluiAV9Ca
         /PWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679670894;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BlgJl6q6nmXLwoducihQkeA4VjkQWrKTU/XpmLER5K8=;
        b=yEfVx5zhGM4plcDwepo4Gv0DIQ4HfTkY76+8TBeF3yTbKvpdaWhGwDPF9xTNdDMHb5
         D/YDXg/T3evVIgsCWos1ltG9+ZdFpghWd9Q1gHAF8ty2sHOI5IVW/2gVQyYHjEX06Wf6
         G8SYumqPRW/tOvT6Xf3F0Y55HU2AueD530iqt6ig6Uy4uc3Aeso1lD3noV9w8Y6zVJIj
         M6iM9BbboWWnQzponDgBoh9nTyFqqHCim+voralwXpjsoIq22YCbaEzD4gcZPI7oz6cN
         uapjZc7dL0EI0sky0ltLUfhk8pO2oGFHaEKxeR8W6jqO8LcOxk+WuzngJoOKY16yPTpu
         norQ==
X-Gm-Message-State: AAQBX9dv7Bl3VLb3mYc6pDqQH0eJ9RKSOaF8V0eXry6RmXHUbuSfIuWQ
	DJpz2SrY7b/bBGh7BP74vZ56mw==
X-Google-Smtp-Source: AKy350bCWxvUk1MaT4pqUixyno5lVt9EBSSrGyxJa0A4C2Bz3kyCAOSzYiktlm5Ro2rq0tSjC73bYQ==
X-Received: by 2002:a05:622a:1181:b0:3e3:90f7:b33c with SMTP id m1-20020a05622a118100b003e390f7b33cmr5002528qtk.7.1679670894617;
        Fri, 24 Mar 2023 08:14:54 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id n14-20020ac8674e000000b003d65e257f10sm4230146qtp.79.2023.03.24.08.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:14:54 -0700 (PDT)
Message-ID: <2d6480e36ce061a63440d1e11d52b02e57ba746d.camel@ndufresne.ca>
Subject: Re: [RFC 2/4] media: videobuf2: Replace bufs array by a list
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, David Laight
 <David.Laight@ACULAB.COM>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  "tfiga@chromium.org"
 <tfiga@chromium.org>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>,  "mchehab@kernel.org" <mchehab@kernel.org>,
 "ming.qian@nxp.com" <ming.qian@nxp.com>,  "shijie.qin@nxp.com"
 <shijie.qin@nxp.com>, "eagle.zhou@nxp.com" <eagle.zhou@nxp.com>, 
 "bin.liu@mediatek.com" <bin.liu@mediatek.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>,  "angelogioacchino.delregno@collabora.com"
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
Date: Fri, 24 Mar 2023 11:14:52 -0400
In-Reply-To: <20230322150153.GO20234@pendragon.ideasonboard.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_081457_768509_46E8669A 
X-CRM114-Status: GOOD (  20.11  )
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

Le mercredi 22 mars 2023 =C3=A0 17:01 +0200, Laurent Pinchart a =C3=A9crit=
=C2=A0:
> On Wed, Mar 22, 2023 at 10:50:52AM -0400, Nicolas Dufresne wrote:
> > Hi Laurent,
> >=20
> > Le lundi 20 mars 2023 =C3=A0 01:33 +0200, Laurent Pinchart a =C3=A9crit=
=C2=A0:
> > > > The typical usage is that applications allocate N buffers with the
> > > > VIDIOC_REQBUFS ioctl, and in most cases that's all they use.
> > >=20
> > > Note that once we get DELETE_BUF (or DELETE_BUFS) support I'd like to
> > > encourage applications to use the new API, and deprecate REQBUFS
> > > (dropping it isn't on my radar, as it would take forever before no
> > > userspace uses it anymore).
> >=20
> > I was wondering if you can extend on this. I'm worried the count semant=
ic might
> > prevent emulating it over create_bufs() ops, but if that works, did you=
 meant to
> > emulate it so driver no longer have to implement reqbufs() if they have
> > create_bufs() ?
>=20
> For drivers it should be fairly simply, as the reqbufs and create_bufs
> ioctl handlers should just point to the corresponding videobuf2 helpers.
>=20
> What I meant is that I'd like to encourage userspace to use the
> VIDIOC_CREATE_BUFS ioctl instead of VIDIOC_REQBUFS.
>=20

I'm not sure what rationale I can give implementer to "encourage" them to u=
se a
more complex API that needs to copy over the FMT (which has just been set),
specially in the initial pre-allocation case. For most, CREATE_BUFS after S=
MT
will look like a very redundant and counter intuitive thing. Maybe you have=
 a
more optimistic view on the matter ? Or you have a better idea how we could=
 give
a meaning to having a fmt there on the initial case where the allocation ma=
tches
the queue FMT ?

Nicolas


