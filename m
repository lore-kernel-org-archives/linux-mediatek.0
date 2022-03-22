Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBD0C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 20:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FM9jS1QDreZngYs16mwHjycUo53/CJxseZ9mM6FLu70=; b=4vxRHJUlV9ToFD
	+Bx+gWSTMN+qSIc0a/hQqlMijkY/mZ/nUtzr3yFWExbycDiC+4LegFJjrnq+9wtueGHkrW7x0OVeQ
	vQI+vJ6f/YBO1vIZRMIk1LEVEcq0JHG45ivHan0F0bEzo/W7GIaquRCivdR75SDcvLAN7IyM8n7oo
	p1hhi1CuDsTAVL3ms0FXVKU7nSY8XsCMcF6flnZoM8uqY2pCWGfXAdvWIwsqS18HyuXAQCSGAUQAz
	ApP/IcmffkzJ07ND6FVnKw1rbYIy/VTxJsQnXhBnEAiBE57/wWTtDlw65z6sJT0HaP0kJcOv6nh+b
	ruTESZLEsCfvAs5814MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWkvk-00C5B9-8z; Tue, 22 Mar 2022 20:16:36 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWkvX-00C58v-QN; Tue, 22 Mar 2022 20:16:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 64D721F42F6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647980182;
 bh=zvjZFzW+8eVSVcYN3AYKVNtaszJpAGzALDjXSoRAcFk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kabOxj6vgJIgSb4+zJOxfFHg2gUKHisLnUGdjCXL47ayPobEqtmU85Se5OnNj1ZKJ
 lHP5OYBoSg+zSqGB2cC6MdOldJKA/cs+Liva5ByTacI1Awr38/OSbKArkS2YRXwX/7
 qK/jOXG1uryB6BADQMhkNszS+CnEP8PqjbkNXCk9XkidPUA9rxS7USwczoQ1Vxjnkr
 q6l2devdSG6Oi6kfoaZcqxXptUJQEKRp+6QU2roR80ZDC3ughWFSIKZSdgpE6+N5TI
 kwx2ariVWo4dTQHkIaw55uVLOOBXeuVUPYzbRvYmavZCpmxL+ThvshomxHrZaUUVnJ
 9sgQUhcnq+aNA==
Date: Tue, 22 Mar 2022 16:16:17 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
Subject: Re: [PATCH v4 19/22] arm64: dts: mt8192: Add the mmsys reset bit to
 reset the dsi0
Message-ID: <20220322201617.s55p4xp3hcb4zgvi@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-20-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318144534.17996-20-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_131624_013007_1D65AC5E 
X-CRM114-Status: GOOD (  15.42  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 18, 2022 at 10:45:31PM +0800, Allen-KH Cheng wrote:
> Reset the DSI hardware is needed to prevent different settings between
> the bootloader and the kernel.
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

> ---
>  include/dt-bindings/reset/mt8192-resets.h | 3 +++
>  1 file changed, 3 insertions(+)
> =

> diff --git a/include/dt-bindings/reset/mt8192-resets.h b/include/dt-bindi=
ngs/reset/mt8192-resets.h
> index be9a7ca245b9..764ca9910fa9 100644
> --- a/include/dt-bindings/reset/mt8192-resets.h
> +++ b/include/dt-bindings/reset/mt8192-resets.h
> @@ -27,4 +27,7 @@
>  =

>  #define MT8192_TOPRGU_SW_RST_NUM				23
>  =

> +/* MMSYS resets */
> +#define MT8192_MMSYS_SW0_RST_B_DISP_DSI0			15
> +
>  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8192 */
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
