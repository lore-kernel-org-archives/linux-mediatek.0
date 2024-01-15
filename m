Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E67C47258
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jan 2024 08:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzLSi9Xf68QuI/Ped1jTKSQxurluWVJHyzG7QlPnxeM=; b=wG8N+QkxXOm/t9yZmFje+nARxj
	K3E+T//Z5hs0poasomDS6/gnHq6B+vdg63ksRCJ+KNf6Hh44kt5gdY3JKhRFncjriy9PcY1qnRDLt
	NdBd3yhXsS3W3FM+Xf1OAKGx2HxFXVUBrKL8CuywkFiB/+d85ZeV/NzU9a9mxFLm2yJ2L5jqvtNDv
	Y73ycdiN3NolYRO775qgS3JXxKd9dpnnnMpoW8EhYazq6i1IWy72gQp2HP+uwh3BPKMkLr4pjAg7M
	OYLLKdAHwWzb7CwI5xXjltSnbCjAcIO8dzAPL2HQon8MjID4bCJta+natPnwPjFKQT3SgPqghypBM
	OBaKk1rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPIdI-008IpZ-0j;
	Mon, 15 Jan 2024 08:47:48 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPIdE-008IoR-1l;
	Mon, 15 Jan 2024 08:47:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705308463;
	bh=oWi9eFoF7K88Adnz8j47J1hlMriFpHzstYkAobfziBk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=zKe69HebDyxC7eRQBzOcqQAagTcarugxixtfa1NcKFE+vOH4vFdRrz8OJg4UDcczq
	 sOvlKx44FqaVtrayHZhav65bCR6K4Ne2IGUJxQs7GQ+FeQVtObx859wXCVzEeOhT+h
	 5xYBpFpP6ZyHWYZaeUREJ5uvOy6QMcBZo1FF+M1dC0Fe7Ufyxfxwf4hII6+kXicAQz
	 OC+vtxnZP6vJqkc/4sMkTQuVEY69KBQc5fTm2shnJeQy3Q1UbIsjrAyiL02oyfQBM9
	 EsC5Xg6EjtEgx+QJqjtXVu3Q84Gb7l8jv+bET0xWsOc89ZdgZwfEqNDf7MF06CZDV2
	 acUTKKjvKfYYQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2CF503781F80;
	Mon, 15 Jan 2024 08:47:42 +0000 (UTC)
Message-ID: <0e1f7d19-9a11-4a65-8a4f-72dafaa5a2ec@collabora.com>
Date: Mon, 15 Jan 2024 09:47:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mt8183: jacuzzi: Remove CrosEC base
 detection node
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Enric Balletbo i Serra <eballetbo@kernel.org>,
 Ikjoon Jang <ikjn@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240112142032.909736-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240112142032.909736-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_004744_729803_42495173 
X-CRM114-Status: GOOD (  15.44  )
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

Il 12/01/24 15:20, Nícolas F. R. A. Prado ha scritto:
> The cbas node is used to describe base detection functionality in the
> ChromeOS EC, which is used for units that have a detachable keyboard and
> thus rely on this functionality to switch between tablet and laptop
> mode.
> 
> All machines in the jacuzzi family are either clamshells (ie normal
> laptops) or convertibles, meaning the keyboard can be flipped but not
> detached. The detection for the keyboard getting flipped is handled by
> the driver bound to the keyboard-controller node in the EC.
> 
> Since there is no base detection in these machines, and the device
> backed by this node fails to probe and goes unused, delete the node from
> the DT.
> 
> Fixes: 4fa8492d1e5b ("arm64: dts: mt8183: add cbas node under cros_ec")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

I really don't like seeing /delete-node/ statements, unless there's an
exceptionally good reason to do so, and I don't think this is the case.

Please remove cbas from the base inclusion and add it on a per-device basis.

Thanks,
Angelo


