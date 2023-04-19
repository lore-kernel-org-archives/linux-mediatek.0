Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46832C77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 04:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LH//JaZnIkbeoy05sN8soJEArf79gUn9eut5lxh/S4=; b=hBnvtKCpNDPayekqdbCN+sm+HE
	wiqcI5ynGuikss1opwB4N+3T7GXAT7SNju79kaez+KOFoMuanQm0hzSqeE6JkGK8glTEXtCPTtVTl
	Ly9dUaqhTxziSVD+wokNhXKxipjYzTgvGVd9CbXckazr/JOOkaXYZLh7DJYdwDGfh3D69FTm6irxC
	3Cl1aPHF6h39FhnQ8onYxqured1ZEqyahtdfP3yUKM9fPOown5V4OwEciFeyX0ukSo+FzsHEyllZF
	Tv1cjfNcxLyx+3YJkVSR5hJen6gd7SA2vDg5H2OEazn+zWo563n8HMyvbGYTy0JqKOsc9zaanmWBn
	Jlb6BN8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pozAH-003ynu-1a;
	Wed, 19 Apr 2023 04:11:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pozAD-003ylA-0W;
	Wed, 19 Apr 2023 04:11:26 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7CB95660318E;
	Wed, 19 Apr 2023 05:11:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681877479;
	bh=+hanj7Q1swnKed11IeyTq8b1CM+HtKVvSWiDT+29coU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aJiO3fMKzh9JimsXRIro2BeBxQ6xW5z93Tbb3JJKwH7kv/j5Jq3yeVElsL20nYOuu
	 P5AslUsgkveiQtPvqGo0LxG14Re9yQvg8ioid682ih3AhaYU1kl0V3kohUm401xCn/
	 zjsxQ9TjKcDD1kIES9I00cvLtjw2vVpID3RTOy2Vw7PjZ+8H8Svax2zqrgrcwvAvLW
	 WFGymcXcyKwX0zVzCpxqWWoFQUbZXQ1b8lNp38W+ZD/HIxEwaEi63JGAuEdpWSHTGQ
	 icWlwtoso6iq77QpolG1Gx1a507om9+vAYnPfJiJA8gm96B1kYDdTzvjviD5B4E2fS
	 Lb0e8CXArgTGw==
Message-ID: <6f4a2c1b-4e37-a760-e6fd-2af285190a76@collabora.com>
Date: Wed, 19 Apr 2023 06:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] Revert "media: mediatek: vcodec: Fix bitstream crop
 information error"
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230418215052.2371755-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230418215052.2371755-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_211125_412162_B021E747 
X-CRM114-Status: GOOD (  14.68  )
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

Il 18/04/23 23:50, Nícolas F. R. A. Prado ha scritto:
> This reverts commit cd61f3c6794bea2b717fe6083ca2ad189db75418. That
> commit's purpose was to prevent the padding from being decoded when
> userspace didn't set a selection, relying on the default one.
> 
> However, as described in the Step 6 of the Initialization procedure for
> the Memory-to-Memory Stateful Video Encoder Interface [1]:
> 
> "Set the visible resolution for the stream metadata via
> VIDIOC_S_SELECTION() on the OUTPUT queue if it is desired to be
> different than the full OUTPUT resolution."
> 
> And from the Note:
> 
> "To avoid encoding the padding, the client needs to explicitly configure
> this selection target"
> 
> Hence the behavior in the original commit doesn't follow the interface
> and needs to be reverted.
> 
> This fixes the following v4l2-compliance failure observed on
> mt8192-asurada-spherion:
> 
> 		fail: v4l2-test-formats.cpp(924): sel.r.width != fmt.g_width()
> 	test VIDIOC_S_FMT: FAIL
> 
> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.html#initialization
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

On MT8192 Asurada Spherion and MT8195 Cherry Tomato:

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


