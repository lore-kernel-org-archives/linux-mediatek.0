Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCD6C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 08:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AiSypvsf0vFuIntMc6938GE+Jid5StU7ajQ4XOIRTT0=; b=O018qSjyUEwUMbmTiS4zHw5fV4
	4rcC5tKc/OB76xd8VgAEDV1Tt43f//f3/eaa/m7vkhJon2DhSMuu/Qhd3EI/p+dNKOM2C9NBPh2Sz
	7fWfMS+J8hJirx46I0Jg1jXAMBEB5S1fobXVw27dsCr5Zjyul31qvGKFx3BOcJzgHgJvM2SKQgw7Z
	Ji+mxPW7Hr85uQmvCoFoPvQs6iVea7Boz+YkYYzXuEKHNDeq+RWseMzMa/gSP6aXmDRdjpzyRfmDv
	hLW6ldVXtNjNTcaCL9WCwo6w0aJfk9QfALF8zDESeRp0dbHHaEXvKB9xzomb9yTLsrwfxjJRrbxPe
	St6yLwsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjbSn-00000000hRZ-3RTz;
	Mon, 11 Mar 2024 08:56:53 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjbSi-00000000hPu-0XFZ;
	Mon, 11 Mar 2024 08:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710147404;
	bh=LXDSRxlCG5CCneQuaLmC2tK3UwO3onm86dAkvFUIKWQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F3gbBwhrhfInMUCcHzDvlAviU2qW0BhsNaWhd4AciDCfigP6s49NtcSLChisuolP1
	 yRcwSCW3dcoWBlWr5pHM7+IstmJ7fvjmD1vZ4/Tcg31pRhtJUi4dpn0NdrD927/M3c
	 n1x8GEY+ulYCLd0TfAi2WANCJUjZcpy96YAMBkfvnxB3XujRXIzW3zxYvExmMCTZuz
	 yVdIKu9LydYr/kVSUX9PTGT0Tpbsl/dWOUUf7YkFdsDy645n/s2ZZ/5epYf8VV7Kdb
	 wbIPwB04Wd0yl2Dq53EAhZG4v8IeQCfnBmZlfP8OPXNTHysWgiKtIgiijkaR22GFby
	 37/lqySviz8KA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 790EE3780C21;
	Mon, 11 Mar 2024 08:56:43 +0000 (UTC)
Message-ID: <f7fb18dc-817e-4d93-94a8-a4b7493cc8a6@collabora.com>
Date: Mon, 11 Mar 2024 09:56:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: pllfh: Don't log error for missing fhctl
 node
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240308-mtk-fhctl-no-node-error-v1-1-51e446eb149a@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240308-mtk-fhctl-no-node-error-v1-1-51e446eb149a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_015648_425622_46E9DD5D 
X-CRM114-Status: GOOD (  12.51  )
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

Il 08/03/24 21:29, Nícolas F. R. A. Prado ha scritto:
> Support for fhctl clocks in apmixedsys was introduced at a later point
> and to this moment only one mt6795 based platform has a fhctl DT node
> present. Therefore the fhctl support in apmixedsys should be seen as
> optional and not cause an error when it is missing.
> 
> Change the message's log level to warning. The warning level is chosen
> so that it will still alert the fact that fhctl support might be
> unintentionally missing, but without implying that this is necessarily
> an issue.
> 
> Even if the FHCTL DT nodes are added to all current platforms moving
> forward, since those changes won't be backported, this ensures stable
> kernel releases won't have live with this error.
> 
> Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL hardware")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



