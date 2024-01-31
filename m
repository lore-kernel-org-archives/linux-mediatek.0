Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3C2C47DB3
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 11:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kC7ZUyRsL2RyGSWjt65PVi8O3GPZCvUseI9ixXi4/x4=; b=EvZnrfU6XIBC4LU8HgbA3S+O/A
	YI2n6UiIEzkQvlJ+g79rG81IbNPqiNRx0zuOL7nrh1Uywz1bgfiS0tJXdNUF2Q3sIoEgsJxz3A4HD
	Gb4oQYolGxKd6xMotaw3pwZUJmY0qkWr0q+ryfdV6JM2+tGxxS3moqgoSNeTV4YKQlhLzCT4S/dmz
	Jpxhl5sViX/2u/ELQyBKGudW4h8NEugo/f4EwWRQtCT8KVrgGA/MkqTU21s/3BnVMnS2eYvCTwpRP
	KhCvnXDpEEeDNTq3V94dIwjvkB8JF4SwYuyHEwR1+BFHWoX93dMC829kg0qzvIHQu3UEt1DjK9dmp
	oiohl5Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8Lm-00000002wjA-2bOi;
	Wed, 31 Jan 2024 11:01:50 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV6CV-00000002COw-1DWS;
	Wed, 31 Jan 2024 08:44:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 330DBCE0FFA;
	Wed, 31 Jan 2024 08:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB37EC433F1;
	Wed, 31 Jan 2024 08:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706690644;
	bh=d31luWYsuQdq6x9sI290GYoxyL+owfx4MYBc1lDFsLM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qHl11occenh/ZVYFwfCIjM+3JZ6q3MPpatzFQmlli0t11Gb9OgpJphqVURbu5U2VJ
	 OIZZUaRuKh0/OiZvZWf8MouxKYQ49Vmv+Tgfe73F7WYtJu8+W19NiMuwY7ejedOnLA
	 xdloSbMLj7qhEskyFXprMaD7k+lchonf+FGcrlc0p0nTl0bGB4dYXA711e3xS/gTRb
	 tNOFPmL4yfdehh2Rkogvd0PpBE94/hPzGA1DAQo7Jjw7UCQrRVUa3ZJxFIHj5o3K/g
	 NG2XQqxdUJyG0TLmmkgyIqnL7cyATNsEwya/gLRrTjSyS+yaQGJVuA6qOjWWwa8uNO
	 gobBRtnRTVpKg==
Message-ID: <b954441a-5dff-46b5-910a-2396d0be2d69@kernel.org>
Date: Wed, 31 Jan 2024 09:44:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] soc: mediatek: mtk-socinfo: Fixes and cleanup
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 William-tw Lin <william-tw.lin@mediatek.com>
References: <20240130095656.3712469-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
In-Reply-To: <20240130095656.3712469-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_004407_545137_68F720D2 
X-CRM114-Status: GOOD (  11.62  )
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

On Tue, 30 Jan 2024 17:56:50 +0800, Chen-Yu Tsai wrote:
 > The new mtk-socinfo driver has a double put of the nvmem device used to
 > read the socinfo data. While fixing it, I rewrote the read function to
 > make better use of the device node and device relationship.
 >
 > Patch 1 rewrites the cell read function in the mtk-socinfo so that no
 > resource leaks happen, and device lookup is more efficient.
 >
 > [...]

Applied to v6.8-next/soc, thanks!

[1/3] soc: mediatek: mtk-socinfo: Clean up NVMEM cell read
       commit: 82e5d7d793e8aef1275dae266427cf048a7459d6
[2/3] soc: mediatek: mtk-socinfo: Add extra entry for MT8183
       commit: 54d21dea6a6c117f3cab4caa1f9c3ffafb515dd6

Cheers,
Angelo

