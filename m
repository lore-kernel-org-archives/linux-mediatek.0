Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9229C606A32A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 01:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2wuOmdXM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PSXHPF7s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bgSIbrhhX1M1S/mhIphweUgHFMz7lfbrdfHFK5Cb/eE=; b=2wuOmdXMl6UVsi
	j73k8XlRRNjeEj/pjkzAIfsUkOvlLhuaYownlHCxh1pEUU9GECze4ZCCwVGvJObX8DflEJOHVO5sy
	BZvC5ob/0F+gcPVJS0ErCbEsxnHsZK0AHhC7UzD9YEY36ecu47pS0r0ket9BQy+32IPTHLGwl2ys3
	zl1WebIhekwMZSA87C1X4X4xQ5BXwKdbCFqDl27wTGHvpzEYJo0v0xLuOihVC3eL5PP3Cj7mjUwXs
	Hlcq05w1maBx1eP+9IrVRYnN7sM7gMTIhCyCUAd1XRKEpQuFgLtObDPNrn9JpC50UYtqxc8M7sgCI
	td3iXfmGmJx00t0k1oCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT7Yh-00000004HEx-3wlN;
	Tue, 17 Nov 2026 01:00:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT7Yf-00000004HEU-1WUH;
	Tue, 17 Nov 2026 01:00:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF3A541A06;
	Tue, 17 Nov 2026 01:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3221F000C4;
	Tue, 17 Nov 2026 01:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877224;
	bh=bgSIbrhhX1M1S/mhIphweUgHFMz7lfbrdfHFK5Cb/eE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PSXHPF7spIVqe2ztBNDDhOyYVVdgDBOHFwE50CSUKJP/2nwXXWyJklRJOhCdEj6HQ
	 iPZooWFYCdvtK3lEDbYKgpvpWu++UIHhC0Kcxb04kS4rlzrgKlAEF7JY3kCW/+r+xX
	 NLgumWSFFMKlBgBlqxlizlycsYAwGc1yKgUj6Lg8wFoHOpZFfoXVDqnZwKSfufBV30
	 9E6AzsxjvDLpoh4+IcM116kHk5mja0+V8XEX1J5UvlxFt/BPJs52DpeZ6J74Z8BcIp
	 SXjMgGE0dvaod3eD4zSUV59LAygTs8n0PcY9MPMxipOfIJ3lyx9O6ptBdUDy7MLMer
	 30FpotCBC8xYA==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Leilk Liu <leilk.liu@mediatek.com>, Rui Cao <i@udp0.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 stable@vger.kernel.org
In-Reply-To: <20261107-mt65xx-qos-fix-v1-1-9d9c16a584e4@udp0.com>
References: <20261107-mt65xx-qos-fix-v1-1-9d9c16a584e4@udp0.com>
Subject: Re: [PATCH] spi: mt65xx: Remove the CPU latency QoS request when
 probe fails
Message-Id: <179486355915.2504946.5816262629767344458.b4-ty@b4>
Date: Mon, 16 Nov 2026 21:12:39 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ueKoG72WP0KE1M/J03C8AU5NedkldPwySMm1P4vDO9M=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+L1fdF3Ncc+Ole4JbK9bpNv+1eNVoOnsNn4TyBMfoF
 0cc70293lHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJqO9l+Gcn8Ozcvwsfj8+4
 8+XP9W2bZM+XZL1mSpV8qsLfK13NfWsXI8NTO9MfSvs05/O2dExeELatWiat17E/5IbBku/V2cc
 SlFkB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 07 Nov 2026 18:13:43 +0800, Rui Cao wrote:
> spi: mt65xx: Remove the CPU latency QoS request when probe fails

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.5

Thanks!

[1/1] spi: mt65xx: Remove the CPU latency QoS request when probe fails
      https://git.kernel.org/broonie/spi/c/d4cb2717eb13

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


