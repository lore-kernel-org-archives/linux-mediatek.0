Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18CB606A893
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 10:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JxUeMOB8;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qMyuojZm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Hl3+N4JPEAimQqaE2OfAnYmrybBk8pfQNCorbB15Ywg=; b=JxUeMOB80n6xPT
	0moVdbngH+MIuEkDOi2E2FcPo2nOmwcOhkdn80BrEy3NJzvCXUzqVVS5u7tpontyhC4TSPm7FcaEC
	1z0Kkz3SYpfJVVWjZ8lU88OuD+6rZFUvlJKYmSLjmjU5FaZLUj/8HvmEYNTXumgVMLaPx1mavps9a
	f1YU6ClFrwtm2RQdUzbx3UjpaVXMZEyciwWJeykdp749HpeGfXPjwXXj8GCKl1spL9jKXlzITH3G3
	sxH+tofO9AWtlcZBGgzse1cx/ML+Irn878Z5f66aKqsQIhASrvRzM04VC2P/CZXwsNFudxQgBh7t0
	qHkZXgd5/3gWtH8VzNxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGjX-00000005KN7-1xuy;
	Tue, 17 Nov 2026 10:48:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGjU-00000005KLW-49Eh;
	Tue, 17 Nov 2026 10:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794912490;
	bh=x4WVJR1u0uNzb8LS1d4YG5eAfX/gHB6/qkNUn1eJBe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qMyuojZmWYZ6iW/s7zSQ7lmEd6YkaEcSII3RGhfwK/0zBJ+nMsAKCJPUkoHr0qBBe
	 wd8NFMfAvO8/HJ6u8TCepvHgkUa2U4FveX6ZO0Bzq/W2z8lHvdOR8FJnimTpddXYSg
	 orniG//einVTXOXvI5JdtaPgwtzNRxSB+MLrtGXsqSPqerR85b3lld7f+Nirrv6QWi
	 EVvxc782PM8FbZODG491ouJ2JuE9/WsQd2vjs5JufchLKH21QWcL+z3fuhklGAIgAB
	 XoOUij7A9v2LInduUXa6ggHS72sNwefhTykAGUQHiogidss4+XlgCgIWx2NkRebBMf
	 7pa2UK4TuOK/w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E27A17E04B2;
	Tue, 17 Nov 2026 11:48:10 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Lu <roger.lu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: mediatek: SVS: fix device reference leak in svs_add_device_link()
Date: Tue, 17 Nov 2026 11:48:06 +0100
Message-ID: <179491248221.154190.12390341729677427224.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023082948.1854252-1-coiaprant@gmail.com>
References: <20261023082948.1854252-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_024813_189054_3D786F1B 
X-CRM114-Status: GOOD (  10.68  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026 16:29:48 +0800, Coia Prant wrote:
> svs_add_device_link() calls svs_get_subsys_device(), which returns a
> device with a reference taken by of_find_device_by_node(). If either of
> the subsequent checks fails, the function returns an error pointer
> without dropping that reference, and the caller only checks IS_ERR() and
> bails out, so the reference is leaked on every -EPROBE_DEFER.
> 
> Both error paths can be hit in practice: device_link_add() returns NULL
> when the link would create a reverse dependency or on allocation
> failure, and the supplier status check fails whenever the supplier has
> not bound yet.
> 
> [...]

Applied to v7.4-next/soc, thanks!

[1/1] soc: mediatek: SVS: fix device reference leak in svs_add_device_link()
      commit: 8ba2b21adad087d7dd2fd8b12877ead8b982e694

Cheers,
Angelo


