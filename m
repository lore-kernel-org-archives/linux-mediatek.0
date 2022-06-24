Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607B5C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 18:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8YZ0FlpKNjQh145NlFzHBJEoOS4QyORU+m6NdHwFjQ=; b=2IHTSqt9kyMb3BtXAj6paz7n6g
	C1ub9GbrpxmM0xViq8KdQS2UJxz+y/i2IZfhnOLQBZBQLUS5JKLCzU+q/BLKLFUT6dpJ3Wht+lJYC
	SwvkWoYhXNAEFMQU88h0c1GgX9Kg7uvNjLKeDBuT7+ZB7Nig2R69T3wAmRy/1KaWzB1RUfJllVvcy
	nokDlsBCoPyiQEGxOyJC6RTzdklfAc8o0VzehtFYDjHOeJVgOnhlEVdA71KhxNSe6JfvIOzRZpuz6
	T1gz59MKzsayDqSFXUwBAleYrxn++ct7f0Q4kkvENKPdlxmwLMtRO4DY+j/jaR/JZRHA8s3chjIJs
	/H8hRTzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4o13-003SUr-5G; Fri, 24 Jun 2022 18:26:49 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4o0s-003SS5-7E; Fri, 24 Jun 2022 18:26:39 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7836066017DF;
	Fri, 24 Jun 2022 19:26:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656095193;
	bh=3JB1GgNrKV4fJFiSyBLBNDtbG90NzfxBMJHl6mKODBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rlf89ZSBbrPksiZjYRU62RDtXMA1jiKQI60SGGBuscOB8hio++rjRz6Of6IRbDU1H
	 8x8q0ExI/UNT3zDI8c8Hv4ID4HTbnRJBUOh8tJEQpEzfITdoao9P+h4T4qgRQnMZqc
	 yA00Pp3ZSDTzP4N0dZVmuwluKRjTdVBOoqBMompzm9BzZ97GuzcZB6eP/kG0o5/EbF
	 mZv1CzAhz9azqgd/uCpKD++9lOeN+PhfGBjLAwka3xDdQDtp18Ma9/B22yTX3gFUa2
	 +4WTIoPwSX/EnrbpD4g7eAEkgrJluOL7T1Pvp/XxKz9nRBMZCddhs4xJKcNTJJR4gH
	 Jf4T+HPq0jAkw==
Date: Fri, 24 Jun 2022 14:26:27 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 2/5] pinctrl: mediatek: add drive for I2C related pins
 on mt8192
Message-ID: <20220624182627.nzz5js4ndcq4a3ig@notapiano>
References: <20220624133700.15487-1-guodong.liu@mediatek.com>
 <20220624133700.15487-3-guodong.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220624133700.15487-3-guodong.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_112638_427488_09F5CDC6 
X-CRM114-Status: UNSURE (   8.11  )
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

On Fri, Jun 24, 2022 at 09:36:57PM +0800, Guodong Liu wrote:
> This patch provides the advanced drive raw data setting version
> for I2C used pins on mt8192.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

