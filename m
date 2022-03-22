Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5A9C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 14:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWoaJIwJMMvR8kea8HRTwqEUUS+nAIRs08VM0jZwVlk=; b=v+Y7Zxfj/KMkro
	9lBMYcBKsVbiSBZbK7KpH+uU7zkCW27ygjYyj49yMbZkXRcSy75M/2zS+Zdii8aNKOqUgmxfyHcrC
	LKsC8VdRQHoMtvl99Mo6m6LVtv1RH1phsC9bHlnB/1NXvw/f0hFuUgm62RMKAiOdQwS+tlGOEb+kU
	+dm+WCUQkYWyV4F9awK2hrnA/hFTltczwaTE8VEUKj2Tn72ZJIDXPjn6zuwyk+Z0v3GLwUvaHKmzW
	EkrstX/yytaJYhPj9VQFyVi9aBVaI4/nAmg2fzLivRXdDtsSAUOnw6RhFzindeMyTDbNujaW0sYYb
	CCzeSC+Q0HXcfKH/MMJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWfMU-00BBU4-AP; Tue, 22 Mar 2022 14:19:50 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWfMH-00BBRl-Lw; Tue, 22 Mar 2022 14:19:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 9F78D1F4413E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647958775;
 bh=2ZZiH3Q6QoDzKHSBWyIRldNto/3FwFwrN/F38RcE6Ec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h5WICPDqkPjkv2ZhwlTveB9UxtzmX5E4wncmi9Ziyd6CbKMgZwtyBpgIb7JhyvuhG
 t58Of7F4ECbXqfCKOxpgzIpQK0Ex2YRglMYSlVfuc+MCTK/HyAbw3biC4iE171edH8
 X//Y1FGFuhChsFJtX1ngmIFqxC4+nHAlcjywAUtzNxJhzFZDq047MXnn8unHJtm6xV
 JsrU7RMeNX9VIpRcA/exhmTiQN69hklPbFV0NguvQNKNSb/kqxnnpZIO/gwBCyAMGG
 uCJYyHRegXLoa2WnYqYbiiGasWtZfHldT7oY32nTxvaXzTnmP0DuqqQZpuK/Huhcj4
 B5gTzqBwgGPUA==
Date: Tue, 22 Mar 2022 10:19:30 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
Subject: Re: [PATCH v4 18/22] arm64: dts: mt8192: Add display nodes
Message-ID: <20220322141930.blpksmixuefhdguv@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-19-allen-kh.cheng@mediatek.com>
 <20220321232657.6z2g3p2aflixzamp@notapiano>
 <28c6f778b312b53ec22aec536dadfb3d7d85c35e.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28c6f778b312b53ec22aec536dadfb3d7d85c35e.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_071937_878766_96C3DF98 
X-CRM114-Status: GOOD (  17.22  )
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

On Tue, Mar 22, 2022 at 02:15:28PM +0800, allen-kh.cheng wrote:
> On Mon, 2022-03-21 at 19:26 -0400, N=EDcolas F. R. A. Prado wrote:
> > On Fri, Mar 18, 2022 at 10:45:30PM +0800, Allen-KH Cheng wrote:
> > > +		aal0: aal@1400b000 {
> > > +			compatible =3D "mediatek,mt8192-disp-aal",
> > > +				     "mediatek,mt8193-disp-aal";
> > =

> > Typo: "mediatek,mt8193-disp-aal" should be "mediatek,mt8173-disp-
> > aal", otherwise =

> > the drm driver doesn't even probe. Typos happen, just please make
> > sure you're
> > testing before sending to the list so these kind of issues can be
> > caught
> > earlier.
> > =

> > Thanks,
> > N=EDcolas
> > =

> Hi N=EDcolas,
> =

> Thanks for your kindly reminder.
> =

> There are two compatibles in drivers/gpu/drm/mediatek/mtk_disp_aal.c
> (mediatek,mt8173-disp-aal adn mediatek,mt8183-disp-aal)
> =

> In 8192, We should use mediatek,mt8183-disp-aal because of design.

If that's the case, then the mediatek,aal.yaml binding should be fixed. As =
it
currently is, the mt8173 compatible is expected as a fallback for mt8192. [=
1]

> =

> Do I need to add some information for this in mediatek,disp.txt?

Note that the mediatek,disp.txt binding was split into several yaml binding=
s.
The binding for this node is now mediatek,aal.yaml and can be seen in Chun-=
Kuang
Hu's tree [1].

Thanks,
N=EDcolas

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
tree/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml?h=
=3Dmediatek-drm-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
