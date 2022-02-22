Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3C1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 19:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXyjV7v5onu2iePXjtqxbdl8PcmiHP9HksTYbGx0B4g=; b=H8tFZhkPHkuTl6
	ZLGgl3oyhsX08XVLRktmnmaz1xb0o7pI3drnMxOp3n2vjXK2U2nhu1xNvl9WECFmeU9Yn77Wa1emt
	E+Vc6QvPGRUnYQTisSiAT1u5WmHNeYbj+GuoLxfgZC9LPO8AUyLif+atnjH1KgKtt/I1hJnVmJRWB
	XexFUf6l7klE0HyRHf+jDsmLvwXX1YBZ4GKgx8cF5LNy58E6Fq6AjFvB1DuqrFYTrOk4SCEXPwN7k
	w0M0pnPZyhoyZX5Mrr1zY3sPMPdlbN+1xd1AksmPjraagJdt/Sf1lqU5fhQaSNQY6N8Sd7Xm91/Xu
	wX87U23S1Zj+GiVCSGYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMasf-00BM1I-ML; Tue, 22 Feb 2022 19:31:25 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMasR-00BLxK-Up; Tue, 22 Feb 2022 19:31:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 94AFF1F42C46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645558270;
 bh=vZziczXassul2CymxgXhkwNg2UBW/i5hySVH6iKoSkA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X87BBKUrjMdOyVJxoPd+Sq7cUKuydQJm41Lm+Z546naJqX88X56ptY+ktWPha0r34
 9o8ksTzO0Ra25o4ZDf0EKdbDCKPqe2Qye15At2inxVXZ7fzr6Ku5u219fzWN12WGJO
 v0LNQv9flc2atvScVzmq4jYULiQIeH2dHfJ/VHJtEB0DAQ3dAcG4cQAkBeDD0mFSGC
 6boEV6nUNW6xHNgZsAyiX4yUVlSUdnrlEsq4rWq495jhQqw86D8cBKvEMwjfYR+d2o
 +aZbmBQ6xSD+skSUTYmCGBXkAnGEQiwTpJz+AZ7aFo7iJm4Zt12KxC9/d34eYRTJaE
 wMF8u5Tkmv8fw==
Date: Tue, 22 Feb 2022 14:31:05 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Subject: Re: [PATCH v2 03/23] arm64: dts: mt8192: Add spmi node
Message-ID: <20220222193105.zw2e3bhpfymk4kv2@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218091633.9368-4-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_113112_147980_65BA0574 
X-CRM114-Status: UNSURE (   7.22  )
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

On Fri, Feb 18, 2022 at 05:16:13PM +0800, Allen-KH Cheng wrote:
> Add spmi node for mt8192 SoC.
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
