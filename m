Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D1AC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 09:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsgB+eVUnR/ybqDxu5TtMVeh5JwwM/GwAxmrqNhVGPs=; b=qW07ReHmHcX6vQp29HJuNH5f0d
	ufzX86vHfqnTfAWcRXfd+4EWHW2nMBxDuVrL0WHoBzc0jk+Fq4G2gLQesrmMzmE/Mgv7T1qYd8T7R
	bv4Qxcs4bJVlxzRWT+COS53idaInRAahI1PnF0L/BZ59/8XR33bcfkcV3+yEkpOK2b5jS7X+KF8ah
	Yi3bkW1ForOsdhvLWU5YlhF/C1QqifaMFs55VZAPEzMRmLd9AOE2d5Mdt1auBHNfD0mBby40qZLrw
	jrGoGFbW4pb9d1a2YL49wzBMFv7mxR3XrPO4fNEcYKcmahjSyE3mfxbCRj4YVYOJXRkFiIcNYco+9
	hDI/Ki6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKapv-007QCE-1A;
	Tue, 02 Jan 2024 09:13:23 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKaps-007QBI-0B;
	Tue, 02 Jan 2024 09:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704186798;
	bh=B+g24IYiBKORcfZQs1hoAavc4iFduekqDsr9toXcU+g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lPv38sIrIyOx5QurwJmCJW1n3tFAcAidBfIeLyGrUDIO95QkL/6usSSP3retXr2jA
	 ZBsUxnoxjgHSCUzlyybC//aWBaHo6F+w6I77sXGm+DgG1e1QSBHUvdctlqyhRJHLwJ
	 PQ/JqdFkMxtur2GbXZEXQnZdUh4hfcEMLAUjarN+tzrY3bLeiXbyTNskhU1IjKgE0w
	 OUAo5VLc46dC1aLlzRcsZiQrAZCxCymBIEYk5Ek+RpXwo/Z488/o8ZtieHBdLNjZZB
	 enZ77+Z97j9jAxpCbYREEqMm6qIqAFgZ35eMt5JMMjKoBtVaRbG/1YlKhijxmHEP2T
	 S8xU/Lp+2gBuQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E222337804B2;
	Tue,  2 Jan 2024 09:13:17 +0000 (UTC)
Message-ID: <b2b8d64d-c975-45ed-a4ec-ff1b9a14708f@collabora.com>
Date: Tue, 2 Jan 2024 10:13:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm64: dts: mediatek: mt8192: fix vencoder clock
 name
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, tiffany.lin@mediatek.com,
 andrew-ct.chen@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, kernel@collabora.com
References: <20231228113245.174706-1-eugen.hristev@collabora.com>
 <20231228113245.174706-4-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231228113245.174706-4-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_011320_226500_429A6E60 
X-CRM114-Status: UNSURE (   6.53  )
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

Il 28/12/23 12:32, Eugen Hristev ha scritto:
> Clock name should be `venc_sel` as per binding.
> Fix the warning message :
> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: vcodec@17020000: clock-names:0: 'venc_sel' was expected
>          from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
> 
> Fixes: aa8f3711fc87 ("arm64: dts: mt8192: Add H264 venc device node")
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



