Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F99EF4613C
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2026 21:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=8fiZqmSlcjEeyMVpMuctcJ7hZfE8xJ1zRQQoJcKO8OE=; b=sp3ewGg3FZLWaY
	4M442O7cWa1yWb6NzsZaxkswvnpC7BK+fX/PCCfoMHDWxS2ukod9Sm/aVqB9ahQ8xfjs9Whgp0FqS
	022dF4ERHZvEsy1CaFWKIhVtYvx4XSvkUlTJ3P6Co/kj/pz/gEcQWgMBm998a5gesT4RkbtXXKmDp
	kKerZut510OeRtE2093NKnmv9vfWbGbNLtoFaXx/9mu9HMAfJCRwOjyh6gKgwB8eN6pYc76JCsDEG
	zcwELF6O5e4BMb9p5DnwPCYUzfqH8VmA7ShOgdACod7ozh7DNvBcWj//d1Smg41mo/D7PpYdLRUNy
	xoHb87DSZPAtK/eX+emw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4mzB-000000001gx-3z8Q;
	Mon, 23 Mar 2026 21:38:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4mzA-000000001gd-1t4W
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Mar 2026 21:38:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D98142A39;
	Mon, 23 Mar 2026 21:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50190C4CEF7;
	Mon, 23 Mar 2026 21:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774301935;
	bh=gAjYYf3hRs5vi0OKE6ikZD9bVDTcKqaoB+grQvL90TU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=i9SsEylfmybUGpWnTHIKaIPZbTnAyhfDzNDlpBqstx+yFvzpyb6AsTXIO1fr0zYaM
	 PVxQPkXLPsmWkbBC8CUxGi7Ug1GALNpDFjybqmvk/7B53kKLZR7KoGA9HJgzJ9Xya4
	 5dlc5afRO/J7dpWYhGrNTHhmBY4GG7wVW37Uz5efYhe99n7B8nk09jLqG2r1oDOWB1
	 JSvIchf3ioKsRJ8S6xxZugbLNWN1bP+3yi3yddVewP00XFUsWu/X4rp2NZk8LQqd4i
	 A5jRK2AvE1PNzpMpKbJ44bcMFDo9xPtJS02M66hn/Nve6BrgjupAD/SE+yjTuD0E4a
	 8mJrCYfK6P4LA==
Date: Mon, 23 Mar 2026 16:38:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
	naseefkm@gmail.com, ryder.lee@mediatek.com, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: mediatek: Add support for
 EcoNet EN7528
Message-ID: <20260323213854.GA1082060@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320094212.696671-2-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_143856_529193_1D0B8EB5 
X-CRM114-Status: UNSURE (   5.56  )
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

On Fri, Mar 20, 2026 at 09:42:11AM +0000, Caleb James DeLisle wrote:
> Introduce EcoNet EN7528 SoC compatible in MediaTek PCIe controller
> binding.
> 
> EcoNet PCIe controller has the same configuration model as
> Mediatek v2 but is initiallized more similarly to an MT7621
> PCIe.

s/initiallized/initialized/

