Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6493CFB448
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 15:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNt8PiHSRhGOiAe8aOruShDn2RME9MmrXhLIkyUnMzM=; b=HKSAv5r/UpUx9yiBpOWqbYwSJ/
	4lyRGMsBrbtwf4PsYFXspHEMB3L4E1+zQvZjytjxGLldzDPinQk5Ht89UyLZT4YQieKY/K+Q3/8y4
	4bvoqYgD3yHWEY7LEpTWJjW3V9V8+4fjFoWzlOtjuYxvGkeFVDi16WQ8J+OtPv/yPRU2Gd6tWDenE
	9/x3Vd34gIHROhAWP2QBfRF1Ep6Z6c4nz9DRNJVf6imIl9kadyW/08agDZV+ABz86Cbnt7YdF+W/I
	Ez7/FaWxsjYYRmmuMlyRldKQxPQgkQKfFQdP86nw4+mVMJScsipDTW6PHSVxSzm2O050A64Q7yaAA
	ngoa5VGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxpdh-00000002vus-2uUa;
	Mon, 07 Oct 2024 15:27:13 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxpQ8-00000002tpk-0Dco;
	Mon, 07 Oct 2024 15:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728313977; x=1728918777; i=markus.elfring@web.de;
	bh=XNt8PiHSRhGOiAe8aOruShDn2RME9MmrXhLIkyUnMzM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ckWnGuHtnv3IpM55KrFLYzxF29UAtZfhL8g71qavPkkAaJsEY5w1NvYdZ2C65ZiB
	 tKWUdwtRrhXp1kKzMw6jcT6BfFe9cuMTG+VGKApbHTd2qryzAcZZMrQknLy+h4ShG
	 BSELoTls79wocpEpqEofbIQncphwv8ZCTudh7bRMvsl/F89OEYLUQjaGM4ekS8u/U
	 sb996rvdPvcKcQm/QAoFN5mWP8Rrs5A3n5DNG18t6hA0EIwhwlmujN1/LrV1dFk+g
	 EWm5ws921nGiDvqrQXZnK5F6r/o7vMBTjhfN51eY1QuYtDJ41KkBLaPOUFCvemjao
	 qjGeQ1eySDD4aXtTbg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQxsD-1tK1EM2k2p-00ObJM; Mon, 07
 Oct 2024 17:12:57 +0200
Message-ID: <0fd2ab9e-66f7-44bc-915e-2a5c2d52d511@web.de>
Date: Mon, 7 Oct 2024 17:12:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Adam Thiede <me@adamthiede.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>
References: <20241007070101.23263-2-jason-jh.lin@mediatek.com>
Subject: Re: [PATCH v9 1/5] drm/mediatek: ovl: Fix XRGB format breakage for
 blend_modes unsupported SoCs
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241007070101.23263-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7Ba8zBh6CcOHXB4RQMIGo0IzFQsQS+XJ52yqKm/QjZ/OaWqf4cn
 Civ4p1nJVkQGwGnIf7wGGzD70wZfDfvbyVxQTzmdjXlzu1fTfEWu8TegRsuYfdHVSwkgh0N
 u3vG1L3sqnf+vHHmazZKnCPEGLwiF1sQbm0Rwn5kWHrHs54fjyEOkQJOdOy4YDCGv+F5ErM
 yR0Zaf16vNRcHG1WjrnZQ==
UI-OutboundReport: notjunk:1;M01:P0:NoyAAvXeFxE=;3AyKjdVXmM17V36gSbpC/Mgn84i
 GaFke1AWEV/mZ22ie5au+YVcwE0CsgarP21NqsWWnV24gLj3ADcXt3tt3X38XbfG/idcZu3+u
 j1PLb3p4TeE4A44s54kjF4na/ANddJRaCTA5ly8GuLIoWPsm72hm6BpbC29AkeIOmpceh1gjr
 MFnWO3vEf0NBFw1XudvKOPr7UeyzaHC/3InlEhSt5o63UoorPwRgiXHHb0kwE2LG0bVf+u18A
 JNMPTR/vY4YvOCdRqhlhOZ5aj7YvK1FVY7fno1t1eEcEJvbYMgSBziFS3IZZX7aTZMQp607Pb
 aR0jH44EZ6gPBXrEtW1j5l7N+tPdO1R2rIB7jSB6SLR31cKy2pgy34u0Lq/40C7ruMaqDIwRQ
 qX0wg8X/jAO0qIBJi+6wTRAvlVIjDxphbBMSp1G0bfq+CisLpgOYZIjGqiWPHEy6yEiW0vzUY
 gllKsvkRGvTntQL2hBPvXfj8Vc+2Oj5m9Z9Ubn4m0IOvo1n0YjYNmLH1xeqrFwZI2oTC5LGak
 Cen/42hJXsnw+jFwc39swZt8H1IP9eDcgLsdzISq00BStOEQkPLfJP/M2oCeAsBhbGc3x+g2Y
 Fjb2TSdrg6GqWgqS4jLWWxop96ezkV0dYx81UcZGlPqzR/z1xyqWqWO8gIqd25EBHgtnfQINF
 qdRDqUYLFjH3TvA4IlM53ViihwlS0UBePv0IUVhRuJvET4TW9HgFOPqLnUNaVl4EMpl27oZOP
 2ZvNoKzqdZTA5+ZmNRrNqIZAmhD61Pf6qabCWuMgGsAl20rLpwiVZHHkzGUZd4Bs9kLzm1dPk
 5TG1bQSGyyqcy8mFGzvmwi2g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_081312_463904_BE728B21 
X-CRM114-Status: UNSURE (   3.01  )
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

=E2=80=A6
> Make the constatnt alpha only enable when having a vliad blend_mode or
=E2=80=A6

Another wording suggestion:
Enable the constant alpha channel only when having a valid blending mode?


=E2=80=A6
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Does a dot really belong to this personal name?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12-rc2#n396

Regards,
Markus

