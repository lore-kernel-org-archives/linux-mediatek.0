Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94250C74A5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 04:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQs3/A2oPwKvLMnOj4v4xK2iNZCZ3DZIPkLahYkVnDI=; b=2hCLnKKHuRt/JaZ1V5CkzTBfv9
	or8TXwUhv9mdjZD+qL8lYrPzlu/MkE/TrvTx0v/Z6LJjC27eyH4fkqeIAta9NOVWb63nziKwOCz/+
	Ha4LSjiFV1iGAMTuNkGgrkeg+Q6jDsTWtGMP8MqITezUamNV0TwEE/XjRTO/mRM86H7dG0AxSWBoh
	MCTjRc7ZjuHgZKiJYbMk7bpbv+LDw+owTZPu5shCwd6ZONEGoKyICgUh6t7sk5V/Gd65G0mPL/6bw
	c1D8Qvv1vEOXzTb6h+P2zneJr9RyaUlb8s2QOtf1Bl+Jjdi2xGGEPrRLhSatPk1BrOzc8uA0tj7dp
	nHGeDArw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peTqv-00BCoA-2g;
	Tue, 21 Mar 2023 04:44:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peTqs-00BCnL-2G
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Mar 2023 04:44:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6DB1EB81232;
	Tue, 21 Mar 2023 04:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAAEC433D2;
	Tue, 21 Mar 2023 04:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679373838;
	bh=2s4jY8/zJcEM72Oy6GTSv34oh2hGJUAKFp8HfH4OOZ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HzGSCHWrSKytehdFqo0TzC0qNk1vSMtVNv9tb0WkdoWdbzigl7Yn7Mle23nE18FE1
	 yFyD8z+Fgy45V9qx6wC1L2VzmOhnvTzPHJLLQA+srNArtMxtUXbe7g83uwIZ1zaAyr
	 tc3tUi+wolZUgLWia2et61DnX3PWIyGuUfMu7moE7CROqFe6z0Mhim2UTGN1f6mogx
	 EP/9gKTruA9lwYh1Kskv68B619fXygjROx8izkuY81m96oihpPxDncfVYFnn6xZ9Gp
	 OanjG/3ViUdqsCMCeAguokh5kjxaeLq83urjGmCUji8y8EBeP/YlpTwJ1BF3VPsucr
	 ToKPWiVpj5wFw==
Date: Mon, 20 Mar 2023 21:43:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo.bianconi@redhat.com, daniel@makrotopia.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 00/10] mtk: wed: move cpuboot, ilm and dlm in
 dedicated dts nodes
Message-ID: <20230320214356.27c62f9f@kernel.org>
In-Reply-To: <cover.1679330630.git.lorenzo@kernel.org>
References: <cover.1679330630.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_214402_879310_CEFED0E7 
X-CRM114-Status: UNSURE (   6.35  )
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

On Mon, 20 Mar 2023 17:57:54 +0100 Lorenzo Bianconi wrote:
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 69 +++++++-------

Do you know if this can go via our tree, or via arm/MediaTek ?

