Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81A6C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 05:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpNRGsVNkqLLaIdJwA7BD7i9TCuARllf3WtcZRC6OLk=; b=VrIalYVgcoBDtot1R9eY8adwjA
	mzh1bAAvlmaftHevCwjxWuasCJ7MrKJS/FhxHmVQHTZAjVShLMYhJxtkyHyuQ2XScen2u14Q2GFwV
	X68aQOo5QO7bUbYOnEZ7BOhGEKEySCWUG6KE7QbtDVP2bFCshNNDGMmVMN1qXkLS6L/1GbJfyJovT
	5On2F1wRo5j+SpIxPUJXVy1VOLinW406WoqJzC1lT3ZdCXXl/qEyJaI5ac3/IAgRk0EJpmd/DaWpT
	1PeU2yaBcCYkysH4YJnnvEKkBQq7WlrfIBj829eG8ozlbwxkC0hFDvcBzZAn7XuJ0djODC0WqIikf
	TEfdVGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfDHc-000onU-0y;
	Thu, 23 Mar 2023 05:14:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfDHY-000omh-26;
	Thu, 23 Mar 2023 05:14:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0652A623EB;
	Thu, 23 Mar 2023 05:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EB3C433D2;
	Thu, 23 Mar 2023 05:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679548475;
	bh=TnjZCeJI5b3jMHKYCdpYkBRkO+Paeps2Jyb4HkRRQ4s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pvAdSmDoH41n+055xbz5GvMexPPvayVlPt5OaE9ad19cUO2t3GqfBkctkcx93tefG
	 EQEyAEZfntwG6i10YI7O7YaRqVRe40sMga0NK7vtPS6QbvPtelt8oXQHjBrqzegqKk
	 sAwfCMKINJFZU0+vpK37ftCdsOhKhEWR08Kn1jWpookkbJU+uuq8WiB9qWlc4l6Lnm
	 ZWLOJRGlK0Si/IjtcL19Ew1YKYnDJGSS0V0LKsA0NrsEOsRN+E+mx+N/nLisgRxrej
	 fmiElReLPGvhLpb2TP+jqWXDXJ3T7m1mkfoASs2PoVWuLphgX5QUfxlhH3m1zFuPW3
	 grWg++yspy7tQ==
Date: Wed, 22 Mar 2023 22:14:33 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: arinc9.unal@gmail.com
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net 2/3] net: dsa: mt7530: move lowering TRGMII driving
 to mt7530_setup()
Message-ID: <20230322221433.21c3e9f0@kernel.org>
In-Reply-To: <20230320190520.124513-2-arinc.unal@arinc9.com>
References: <20230320190520.124513-1-arinc.unal@arinc9.com>
	<20230320190520.124513-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_221436_750291_9B36E10F 
X-CRM114-Status: GOOD (  11.92  )
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

On Mon, 20 Mar 2023 22:05:19 +0300 arinc9.unal@gmail.com wrote:
> I asked this before, MT7530 DSA driver maintainers, please explain the code
> I mentioned on the second paragraph.
> 
> I intend to send a patch to remove the maintainers, Sean Wang, Landen Chao
> DENG Qingfang, listed on the MAINTAINERS file and change the status to
> orphan if none of them respond to this question or review the patches.

Sounds fair. 

