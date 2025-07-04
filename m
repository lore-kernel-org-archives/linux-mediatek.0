Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E115DC8303D
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jul 2025 15:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2VGVficsKZdMB7jd4IO88jbeeY5cNqJJaO2Adkm9qA=; b=gi++0kVyABv427iLggET4M78Mc
	AvPElabnyKze2wnIkPxZSVoOSk9me3grpMlZ4I39IS2Wq6qGmaZ5CtJxd3Ky9PsyFSlgfcvUQYXa6
	cLAGojYImKjpuScMTOKVu5mEX2YfhZyZBiBKAy/VMti/uSp7h8+3AW+FAbWzV/Iu+LcxI6w/iroXw
	NxGIK1iPp2QPJ/3wQzcRY5mzbEQVSw6uXYyjiYwl09qwnYOKiNTEUxAWHOBLsL+sLaYkooj0U+Tf4
	OvDSSZjuQCWgH4kjiHApaSbxGiSHnWLCfk4DxyF11RpVX+EB/le13gHa/odTe9oEUOAxISUZaXzyL
	0GiwO6Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXi30-0000000Em0n-3e3M;
	Fri, 04 Jul 2025 15:09:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhph-0000000Ejcv-46XT;
	Fri, 04 Jul 2025 14:56:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 378EAA53C9A;
	Fri,  4 Jul 2025 14:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EB5C4CEE3;
	Fri,  4 Jul 2025 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751640968;
	bh=wUe1tVAHYsVRseV1SJHF2HIemjtOqk7S/dvCijh60G8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eGJ3O1NCJMPg5dnuVN/zqoFOgMns+rl4jUZc+UNbXHrrz9npKf1O8QyxyVf5iloKG
	 c4JajbJuXqEsL+1p2cqfv4ConEiPImRiPQPLVG4xua62g+F7+bW3nOG2UaUQqTh9Xn
	 rkXnefrEoj2QFS34DqK9Rw97pP1tsP9z1/vhR5ZNK4SEDj584PeU3dKI0VxVGQjSLC
	 ughOBVG/UYns4sBDANtdSg4oqV0SuyrM/HOPY6ohrMr+LQT0AP2PxxCXmKjxXEdtKi
	 k3PQuwiOun2z/LwRrtcus0ZXYr9UCQgxjirtH5Y8M6khfITF0Xx+f4RNmmpPQfsFgc
	 Cu6g752/2s58w==
Date: Fri, 4 Jul 2025 15:56:04 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 4/6] net: airoha: npu: Read NPU interrupt lines
 from the DTS
Message-ID: <20250704145604.GD41770@horms.kernel.org>
References: <20250702-airoha-en7581-wlan-offlaod-v1-0-803009700b38@kernel.org>
 <20250702-airoha-en7581-wlan-offlaod-v1-4-803009700b38@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-airoha-en7581-wlan-offlaod-v1-4-803009700b38@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_075610_089333_0D583F9C 
X-CRM114-Status: GOOD (  10.20  )
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

On Wed, Jul 02, 2025 at 12:23:33AM +0200, Lorenzo Bianconi wrote:
> Read all NPU supported IRQ lines from NPU device-tree node.
> This is a preliminary patch to enable wlan flowtable offload for EN7581
> SoC.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Hi Lorenzo,

I think a bit more information is needed on how you plan to use this.
Ideally in the form of a patch that does so.

