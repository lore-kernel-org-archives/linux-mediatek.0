Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F01DC25B10
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 07:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24DWc6Y1We9GV3ibeLgGfZKgFnGrPOl96b0OOPrEYU0=; b=IBJbVZPWsA85HsJI/ZWqugHOYn
	7NUNwOnCsdv7/JsqowUhIVbYy2YYVKHAZEXabDpqkEGkmfujEXuZQki+8WxU5+BSCN6s9X1Kc1JNC
	3e9DD8muZotLlFzmvcCABuaIkpgOezj+ouYLtMy8kzHn6x8DdT+LskNNuSvkzAAgMU+qC+1o9hm/x
	9w/ElV8F0FgmWrmn86+RSzEme7GHSWnTBLJBTFMI/Eb5vhOv3vcRhR0MEdYC8wygSZEnyQCJW/Tk7
	iaFnLVnBfSXcCKxayx6V5AqQcYEuKfnD/AawzQ9wHaqGfHzMo6RDrsXQdMhBTqxCTfEFWtROJKuB2
	Aj59Aaqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1iLf-00000005WLt-055A;
	Tue, 30 Apr 2024 07:56:23 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1iLX-00000005WIk-0Sbw;
	Tue, 30 Apr 2024 07:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714463773;
	bh=GeswxmYT4bGFOK2AR1iOj85iEdpchJiz/hwjIyiKyeY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1toP7IcX3n2JvpjsyDkchdN1CczXhxVUlN8SskxrFLfuEfNhs9cCFHLj44Ib9sBJ9
	 DaWmnuRs5DzJov4hx2XLarT/dT5vNTH37o3dt5ebbb/1AzXuzcDl4a0FOtV4EwpJEu
	 2qa/8SEwbCAZ0o1faIRMFE79UxwtqVtxa5VIU+NtKHPlS27PwFbEH5+Jj4eqbYNH9U
	 99NtMtMupkIzwMaXPMMUUv1VwROj7isL4MrlBlAErC9hspOQyRqtOoVQ03GnutZRnG
	 3zKXhPoub+DDlj5S7zh2LKv6azNbUu5/10szukkx2R/A55GhLc7+d54vhpsoUI9ZUR
	 p8vKB0Fs1rs1g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 016123781F9A;
	Tue, 30 Apr 2024 07:56:11 +0000 (UTC)
Message-ID: <f104a34a-a1d2-4eb9-8127-cfdb8560872d@collabora.com>
Date: Tue, 30 Apr 2024 09:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] remoteproc: mediatek: Add IMGSYS IPI command
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
References: <20240430011534.9587-1-olivia.wen@mediatek.com>
 <20240430011534.9587-5-olivia.wen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240430011534.9587-5-olivia.wen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_005615_390679_2C3261AD 
X-CRM114-Status: UNSURE (   5.07  )
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

Il 30/04/24 03:15, Olivia Wen ha scritto:
> Add an IPI command definition for communication with IMGSYS through
> SCP mailbox.
> 
> Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



