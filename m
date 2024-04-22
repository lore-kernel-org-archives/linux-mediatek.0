Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32149C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 10:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBudmZO0sBRSJ5GG+0GjQc2BDiuL9ZS4VJG14aKWTCk=; b=Tq95eWnwB5J4HI8SNRlDJjUWUT
	U0D+nCYcltDPo0W1WO98z/RgmCBGuREUTgkGvp7RFuOBL3qN4nAlQRo8F85cLP6RTApt7gG2z3WR2
	Uw4tMMHakKMUfCRr/i42A1HgoPDcBehg9F9rCuhdtROb6teuA4SH+6w1XskqyyCycv5bpU0zd78Mc
	ddm7oL7/QbzQhOimvmb0puE7y5DTdoF1MOoZtVzvcu4PYzOfQ73NpgHbKzBfvBy3dIlvSopCBDAxa
	or+YIO5HMpdvbwoU+rXxmN2HaO7PVydUFIVpmUzVvAlpbneijSZCS523nhM/JA8aAj5rVO4VkW78K
	uKGApCCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqoR-0000000D84P-33WB;
	Mon, 22 Apr 2024 10:22:15 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqoO-0000000D831-3JVd;
	Mon, 22 Apr 2024 10:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713781331;
	bh=AQrDYKjCfdBFoCi8wbOPlT2hjQPA4gTSqxsxAy/egek=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uEdBGkmNA6A4+zGo9iW/eW9F6u0l2tF5LrmH3G0Dsugm25hzGI8B+qO0HPqZJnnWx
	 8MJ2DrUAH+/Tv9lkDrMUM31wpoqvu3i5GG119W/dIF0N48KqtumkWEUSiugtjVeol7
	 WbsSw7Grg9cfd1IBQBO+vatCNoxVp8Gj3KbY11CkC0n/xttuGH9Om+1Cm4gUapbazI
	 EzKYdq/ngix4cHKeZR7549WcUl4Z73BRr3LSy166TGedHoDlQLLNii+oobwlcm+B1T
	 q4ZOePeuwD3GigcByr+BEAjc2KhDJGZPXIgIoPVtDtHm3/Nmy+jeHeF3QsLX1psA1l
	 WY5OOO5Pjmzvg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 922963780C22;
	Mon, 22 Apr 2024 10:22:10 +0000 (UTC)
Message-ID: <256e6f3d-9bb6-4237-aa1b-4a2b8e50da2f@collabora.com>
Date: Mon, 22 Apr 2024 12:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] remoteproc: mediatek: Support MT8188 SCP core 1
To: Olivia Wen <olivia.wen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 jason-ch.chen@mediatek.com, yaya.chang@mediatek.com, teddy.chen@mediatek.com
References: <20240419084211.31901-1-olivia.wen@mediatek.com>
 <20240419084211.31901-3-olivia.wen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240419084211.31901-3-olivia.wen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_032213_000428_65BC60E8 
X-CRM114-Status: GOOD (  10.63  )
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

Il 19/04/24 10:42, Olivia Wen ha scritto:
> From: "olivia.wen" <olivia.wen@mediatek.com>
> 
> There are three primary modifications.
> 
> 1. The struct mtk_scp_of_data usage on MT8188
> MT8192 functions are unsuitable for the dual-core MT8188 SCP,
> which has two RISC-V cores similar to MT8195 but without L1TCM.
> We've added MT8188-specific functions to configure L1TCM
> in multicore setups.
> 
> 2. SCP_IPI_IMGSYS_CMD feature
> This version also adds SCP_IPI_IMGSYS_CMD to facilitate
> communication between the imgsys kernel and the backend driver.
> 
> 3. Different code sizes and IPI share buffer sizes
> Each SCP necessitates different code and IPI share buffer sizes.
> Introducing a structure mtk_scp_sizes_data to handle them.
> 
> Signed-off-by: olivia.wen <olivia.wen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



