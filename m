Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E967ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 09:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g77AlX2Rbe+FjV2n+wD84q1l3nUQ3jiyIttZF++KeBI=; b=S8xsfLfUfxces91eutBmXinP/X
	DbYn9zUKxJHXcsx+8zfFemKabAX94N4tyN7f1IbLocwzxWSTgdkb6+nyGZvvsCz4bc4/vopqZqaAx
	33z6UdRp0L8Z6bPitVpqfidrirERhpuoi7mBv49MnjTbotpjN1+8JFN8UVI5foVu66mmynhwolilo
	slcJ4JtGo0YSlTbeRzsNE9+RH5+UDp0t87diOD1B2nY6W7Z6dy+8uOrLnrjAQyON9d67v57RLSJNN
	QLy9l1d7ZxzKFcrIqaTeLjH/jLgPi3fVbqWm6kdRC54F/qg5jqH3u1b8iFTzBQhtiIKVjjIRjusTa
	Ah6l2frA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxpl-00FpD9-0a; Tue, 30 Aug 2022 09:47:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxp2-00FotF-Tu; Tue, 30 Aug 2022 09:46:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C5ACD6601BF7;
	Tue, 30 Aug 2022 10:46:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661852775;
	bh=yjC89saAgBju8ExXt9nwpmDQQR18E9xc86/sSTGhJEQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AddUnld3tR1MuhWklJh9cxZbTR0S+J3RifWNZeGGGLhVFmcYSHF1zPBERasbYg8uN
	 nxo1Mu92N1gD7OLNFVmCQ0aQV/o/+8bDqhHwHt4boW1gIEhHwQsd/AJmoW2HZZEP1T
	 LI4jeTLXV2F7hvbYf6eGChkbWyi0fTFpivZt42XKQR/K59b7xtQlAofjYQijtWtkvv
	 Jq1HEqkVE4IfUeUTE4TISKWbnoGYlGBJKrmhYkxuds42KygoG3eLOQkOcDGs61UJ41
	 0txWtrYR1/UujPChcQVQSk+xxth56j0rqCPnGGkQqBeqW4A1Mo7BnmVrMyN9umw8hs
	 fDhQkmniXhTTQ==
Message-ID: <a0396687-f27e-a601-1bb6-daa6fa210ea5@collabora.com>
Date: Tue, 30 Aug 2022 11:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] spi: mt7621: Fix an error message in
 mt7621_spi_probe()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, broonie@kernel.org,
 matthias.bgg@gmail.com, gregkh@linuxfoundation.org, neil@brown.name,
 blogic@openwrt.org
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <cover.1661599671.git.christophe.jaillet@wanadoo.fr>
 <928f3fb507d53ba0774df27cea0bbba4b055993b.1661599671.git.christophe.jaillet@wanadoo.fr>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <928f3fb507d53ba0774df27cea0bbba4b055993b.1661599671.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_024617_171547_A14DD033 
X-CRM114-Status: UNSURE (   9.45  )
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

Il 27/08/22 13:42, Christophe JAILLET ha scritto:
> 'status' is known to be 0 at this point. The expected error code is
> PTR_ERR(clk).
> 
> Switch to dev_err_probe() in order to display the expected error code (in a
> human readable way).
> This also filters -EPROBE_DEFER cases, should it happen.
> 
> Fixes: 1ab7f2a43558 ("staging: mt7621-spi: add mt7621 support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

