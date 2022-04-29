Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA152C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 13:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmv2cm+XuyNObx8Bwx9CP6t6e0j2l+DFQS74iTFgxp0=; b=MzqpHj6l8Hnrz/t80GQtlDIqGg
	bINWBWFP4m0EmJf9lZKCcEWI1UE7TL13o5pV+L/bsrWURQbdXe/Lwjzi2cqWoot+i5TjlbZXh+rqt
	wghAG/WrF31iO5qnO+Nki4wM+umtk8Gy4hXraJqm7s9tVWmPSp9KGgU+mjHSLr2HQDW02ok8Wx/O/
	whF7AJYA0EZf6Ql3tqTd42PfRNhfobxC0r/GgGDpeObuo7ocTCkkNpOqDO2EB3GeUR9rzYHHZloJ1
	NcmUPxqznPppba4Rn/2zd+zQD2HauNdIiwBeBRLdQb2PaNzu3dt6n13EQ97Q82Br1eWFE79pliEyr
	8+udEdCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkQXU-00BLTl-I1; Fri, 29 Apr 2022 13:20:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkQXI-00BLPn-QE; Fri, 29 Apr 2022 13:19:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2269B8346D;
 Fri, 29 Apr 2022 13:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB19C385AC;
 Fri, 29 Apr 2022 13:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651238389;
 bh=19u80WrRYBrn0euhR5t2IahZXsXYVRXAnPVdCH6q/OA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uzp9dNrw1fq7kaRwzsuipBWIEcIQrGCJXYGUQ+EJvcUn1wqUYdAMvlbx+LuUGhAKn
 8xd69n0H8JX0CPgb6WjcW1q7XAfUofjuWy9WQ+fQO4NnJ5mRBJAAknOmVRLDPzOHCS
 OS+7RFvMnFVE+xOeV77jBorf1wah47euXafGH6skPCZhCuZrgiFz/g+Lbv5N9ZTIMu
 b5T8hbIzNmL26tDus1GewZO5h9kWYbB+tHrfcBxxkKFQIM3IS7wJgdMb+XHDJ/Xvn2
 3jABx64hHlDYm6X8MbIoOTloGjf005gkwoSMRILhEkLYoCmCClXJdky2dowXC2lUUk
 AT0KiiAs5SSzg==
Date: Fri, 29 Apr 2022 14:19:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: YC Hung <yc.hung@mediatek.com>, Rob Herring <robh@kernel.org>,
 robh+dt@kernel.org, daniel.baluta@nxp.com, trevor.wu@mediatek.com,
 tiwai@suse.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, cezary.rojewski@intel.com,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 allen-kh.cheng@mediatek.com
Subject: Re: [PATCH v4] dt-bindings: dsp: mediatek: add mt8195 dsp document
Message-ID: <Ymvl7x9NTJor/vfx@sirena.org.uk>
References: <20220106064847.15588-1-yc.hung@mediatek.com>
 <Yd4yNkeGlzdULNlv@robh.at.kernel.org>
 <68895a40-559b-13ce-d433-f9b32c648323@gmail.com>
 <9965188904de2e89bc5390fa6c71d9fb243f9d12.camel@mediatek.com>
 <cf9b425e-84ff-af12-72a7-4056b8cbf90d@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cf9b425e-84ff-af12-72a7-4056b8cbf90d@gmail.com>
X-Cookie: Are you still an ALCOHOLIC?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_061953_024299_F9FF7C0E 
X-CRM114-Status: GOOD (  15.32  )
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
Content-Type: multipart/mixed; boundary="===============3916962887537326291=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3916962887537326291==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qbtHrth/VF0HNcN8"
Content-Disposition: inline


--qbtHrth/VF0HNcN8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 29, 2022 at 02:57:12PM +0200, Matthias Brugger wrote:
> On 29/04/2022 07:59, YC Hung wrote:

> > Sorry I miss this mail.
> > Could you please help to check this patch? Thanks.

> Rob gave his reviewed-by. I just saw that the driver maintainer is Mark, so
> I expect him to take the patch through his tree. Didn't realized this
> beforehand.

TBH I'd missed this since there was nothing in the subject line that
drew my attention to it.  Seen it now though.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--qbtHrth/VF0HNcN8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJr5e4ACgkQJNaLcl1U
h9B6jQf/dW9MqjjZQdTkinE+KFUJIRcK4SQ+e5QvdyqXMZ17f40lR3vhJ4Xo1NME
uNZx34lYDN8jy1PAvJa8HlyqyL0nVzOuxN7qjRuMr/uBlg/qhLEYFUcaxZXXc/wR
aGaaF3csCsN0+n/CMwkWP/my21AyyzhXfu8ygvhEVqhdJhetwOtYNfOB/aIHOId7
oszASoq1Jvbpvz7CRKq/Vqqk8O9ASXDpvSERh6iWSkWH4ShJMteoAipC4MndSgSI
rc0LLIZ2+wq+MAdE5KoqccPfGnx2UsJ9+6MzcYc7SbpRx/LirYjr5THGGkLWS/m3
kqvXdGrUS8RZNjj07qJ/cqGj8a/mOw==
=Hfdr
-----END PGP SIGNATURE-----

--qbtHrth/VF0HNcN8--


--===============3916962887537326291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3916962887537326291==--

