Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09221C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 23:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ib83qi53Quo6LR3qQENbjgrRPS63EroE3Q3TsWmdeYs=; b=0wnJNZkLRroUMn
	/srGnDO/8nMPXUVc0+7von7ro795tbbu4TiBpzeW9o7L54rB19VtuW/2a3JPSZy9dB1QJxpObnitJ
	hUMUYN4VWAjH8+Y+vefUlhjo+i4511CKqlPUlI576GgNRXns5CO+yjgtqk43mTEltjaarP2wjFZzh
	hUSw7bzbngyzs6luoirfcikPNwrmu3zSorG586iK/Zuz7aByH1vgXaxdrFWYIaoYkFnn1xaeXP53R
	h30y1P2PpRhhhLkgKOcv3QdQAlGYZA34UP41bocOG5+O0BwgGwLQa8QIubQhdFgqtG57z3LC2pA/Z
	KCL6vEd9x9T3s+h4AbkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNjfr-007B2R-Np; Fri, 25 Feb 2022 23:06:55 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNjfd-007AyX-7D; Fri, 25 Feb 2022 23:06:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id B78DB1F46802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645830400;
 bh=58x7jynVJtBpgB4TfuRcpKnHM5IK4vhp6DiWw95AlxU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K4v22sPr+SGzmsKBtZMST66vqQ51BjGlJy8G8Wr2TJG0kiOPLdZXhKc9ssdCgV3H1
 /BKf7fXASO8Shq97WxREXdvmy2wn7ytKqykGlpQ19eXgcHstqyHyC7zZG2m3TmA8Ap
 tjAqPMnNM6iv59cUoFG21lXC2cIyJ5YZFcoKySholAm/voWW+ErG4hGEo3wQsIq3RU
 e8YUNOL1ttw7/h7ZF8DjQW8hmc1Vxg+YjVXogpLf9f9XxtiBz7TucdogJB0H13hFiQ
 xRfDuLIvkuKUnL9XJPXQ9pAskskiPTMFZ1/ns5nmbIRUXPl54Xe4oOjYHqWRP9veiB
 U2ziB7iFOPIaA==
Date: Fri, 25 Feb 2022 18:06:34 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 15/23] arm64: dts: mt8192: Add m4u and smi nodes
Message-ID: <20220225230634.bqmezldkzraa6v6o@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-16-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218091633.9368-16-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_150641_432049_DED7E361 
X-CRM114-Status: UNSURE (   8.56  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Allen,

actually there's one other thing, please see below.

On Fri, Feb 18, 2022 at 05:16:25PM +0800, Allen-KH Cheng wrote:
> +		iommu0: m4u@1401d000 {
> +			compatible =3D "mediatek,mt8192-m4u";
> +			reg =3D <0 0x1401d000 0 0x1000>;
> +			mediatek,larbs =3D <&larb0 &larb1 &larb2
> +					  &larb4 &larb5 &larb7
> +					  &larb9 &larb11 &larb13
> +					  &larb14 &larb16 &larb17
> +					  &larb18 &larb19 &larb20>;

I just sent a patch [1] fixing the formatting of the mediatek,larbs propert=
ies
on other Mediatek Devicetrees. So please do the same here so we can avoid
introducing a new warning in dtbs_check.

Thanks,
N=EDcolas

[1] https://lore.kernel.org/all/20220225225315.80220-1-nfraprado@collabora.=
com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
