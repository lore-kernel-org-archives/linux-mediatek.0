Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C2CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3oK43b6jtxaUdK9ZxKjlWwkcqjYTBYcMf2Jro2zpLM=; b=p2P1P5ns2RLLBX
	n7r+dkFEU5vWyQElQWM3EjNk0TavgyPFn2UFlJ7pyx9DHmBJyYqj8pmuudtGKMcLJc/fZD3J8s3kW
	arfGxPdfHFYSGYw5VPPmGEppc8/3zzli72kIAZ9K7RkeR9uXEVnsCCxcMGrnfe8zgX+758+g62Qu8
	dq/8iUVIFUJdhizJU8z9rE44xWhbAv+cILNmn7AGb1a9SYn7wPl9RnzOBQ4jHpm2BY5/9C8Lr4QOd
	kgt3zjTQEjgxphCAMgGAHoDup6zvNukVBrlQQQ/or6stSHTulEvxHRuSPIm0K5p13tf0ZEqek+e47
	O/FuMpoTu6+X/7MxlB4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnXm-00CAFk-0E; Thu, 17 Feb 2022 20:38:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnNn-00C5DX-FO; Thu, 17 Feb 2022 20:28:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 174DAB8249E;
 Thu, 17 Feb 2022 20:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D4EC340E8;
 Thu, 17 Feb 2022 20:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129684;
 bh=eaPZj3u0FRK7Q5xe6awF/0VzEPeL8/ugi55otvqTHTw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=O0jDXx7YVJttwC8GYqtbmzpaQxjhnGcqmSgoBaQkIPk39T/GgSLXZ6e8BSdrYkzwD
 u253SKb8Psxb1JEAhsWOg5Z+8k9BLPgX27dU4blshKjXBJhRVbEXniRWsTD6XM9Og3
 Fm5S+/JtV9k32RY696hMC90wH6f0jYJFqPKbZr6CNHrWoXi3Emr6DZkjGYIJEys6vW
 7olIOnG7fjh00YVIGgdqc+0waGDYyvNO5c3VwpjRNKuzvtqisa6Eg/cN+SPrQnH2BL
 +An0lRgc9+46LP2N9ZqJNIt82JP0g8/oi4Ip6U/0Qc+6JdZwPXm7nsLg/vqAMJ+sQx
 SxhGOtbqIr3nA==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-26-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-26-wenst@chromium.org>
Subject: Re: [PATCH v3 25/31] clk: mediatek: pll: Implement error handling in
 register API
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>
Date: Thu, 17 Feb 2022 12:28:03 -0800
User-Agent: alot/0.10
Message-Id: <20220217202804.A7D4EC340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122807_700756_DE42D14E 
X-CRM114-Status: GOOD (  10.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Chen-Yu Tsai (2022-02-08 04:40:28)
> The pll clk type registration function does not stop or return errors
> if any clk failed to be registered, nor does it implement an error
> handling path. This may result in a partially working device if any
> step failed.
> 
> Make the register function return proper error codes, and bail out if
> errors occur. Proper cleanup, i.e. unregister any clks that were
> successfully registered, and unmap the I/O space, is done in the new
> error path.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
