Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7B8C001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 13:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDEUD709UYt0FjgiG/msV7myR0LpqdQLMgwbpdW2vWU=; b=nAaUVGP45FAH+cq4fbJQnkb/uq
	CQnA2zIsQOsRGdw/6BR0dEpCik0NuiYol8iPMV6rgVT/JY0/fow4mRrGf/aneW5YNu25EIcgep6s+
	oS/g6EaUoBSJH6CYCSI6wFvO/nbI1xBPWN+PbRki5XJ61oTEcHlKnwT0QIicDOyVItGX4q7jukHCC
	5YdtnGBtViaYGpzgqtrQuAIjxULJTwOU/sTOi0X57T4oa7kWLlckjVNKIN0fs2GlkTnG+2HUgIGLR
	dQVgZo0ho2tGZCe2ywm/9bcj46lM/QTYegsu2DjyCsXNMj/n+R2Oe29rA5039MVbltgSVJwQ+GrL6
	7MD48+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwQ4-003QF0-2y;
	Thu, 13 Jul 2023 13:31:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwQ2-003QDa-0j;
	Thu, 13 Jul 2023 13:31:43 +0000
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:10:88d9::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4590B6602B7B;
	Thu, 13 Jul 2023 14:31:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689255097;
	bh=kDEUD709UYt0FjgiG/msV7myR0LpqdQLMgwbpdW2vWU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=MsqC4KZJaLsbwjzlNs9FondR2rTs5Uer9WQqF6jh117t04M6NCA5h0LTL6O/Zlmvk
	 xzbP4jWlJLirMvS9Bm6NdM98TWjsBam1fx7oPzx7Jv0GQkU/m0LdKm8EhRXZZlX8dt
	 G+Hg3P9PFpKopraeY47HPne4T1WtbOH2bhYFdE4VMzygrD0aEC6FdvKmkiFeE/JmmJ
	 9hERdEOFoad1su/qEdOXb5M/KnOT2eK5qcYu7xmcCMAlVXxe46SoU0TYJqOXJuHR3V
	 rfuD5n9mzbFZorP0R8wyXTl5dDapFN5l/H0wt9Av+6FZey5745iCgTEF3/vOcM+daA
	 AR2kZ2YT49Ylg==
Message-ID: <e10baa4d1b7b847b474a0836ca34b9b47098c8f1.camel@collabora.com>
Subject: Re: [PATCH 0/3] media: mediatek: vcodec: Add driver to support 10bit
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yunfei Dong =?UTF-8?Q?=28=E8=91=A3=E4=BA=91=E9=A3=9E=29?=
 <Yunfei.Dong@mediatek.com>, "nhebert@chromium.org" <nhebert@chromium.org>, 
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "hverkuil-cisco@xs4all.nl"
 <hverkuil-cisco@xs4all.nl>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org"
	 <linux-mediatek@lists.infradead.org>, "frkoenig@chromium.org"
	 <frkoenig@chromium.org>, "stevecho@chromium.org" <stevecho@chromium.org>, 
	"wenst@chromium.org"
	 <wenst@chromium.org>, "linux-media@vger.kernel.org"
	 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Mingjia
	Zhang =?UTF-8?Q?=28=E5=BC=A0=E6=98=8E=E4=BD=B3=29?=
	 <Mingjia.Zhang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "hsinyi@chromium.org"
	 <hsinyi@chromium.org>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>
Date: Thu, 13 Jul 2023 09:31:27 -0400
In-Reply-To: <aa042d72211331e2752f6dfd552911a1315a3324.camel@mediatek.com>
References: <20230711125749.15555-1-yunfei.dong@mediatek.com>
	 <af101e6831affc2e7152455ded1d779d38f1cb35.camel@collabora.com>
	 <aa042d72211331e2752f6dfd552911a1315a3324.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_063142_460037_D05A0996 
X-CRM114-Status: UNSURE (   8.89  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Le mercredi 12 juillet 2023 =C3=A0 03:11 +0000, Yunfei Dong (=E8=91=A3=E4=
=BA=91=E9=A3=9E) a =C3=A9crit=C2=A0:
> > This cover letter is missing v4l2-compliance report. This is needed
> > whenever
> > format mechanism is modified in a driver (not just for new drivers).
> > Please add
> > and make sure there is not regression too.
> >=20
> Forgot to test v4l2-compliance, will add in next patch.
>=20
> The flush test not include H264 for test fail, according to mingjia's
> information, maybe gstreamer set wrong format. H264 fluster can test
> pass when kernel driver force h264 in raster mode.

For everyone interested, I've rebased MT2110R and MT2110T support MR in
GStreamer. With the offending "return -EINVAL" removed, the test passes for=
 me.
Consider updating your GStreamer build, let me know if you see further issu=
e
with GStreamer in this regard. I'm only missing a firmware with HEVC and 10=
bit
combined to confirm HEVC works too.

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/3444

cheer,
Nicolas


