Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC2FC83F3E
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 07:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ew7yaUsgp0OjQZeoFJyivTvysZMOPJ/v3ufQB1O/x3k=; b=1fS1o7+dmhyo4Y8fP9NhPPBigK
	Cb79gG9f7B6giQ/0GE7Eydevw32IiuVmZ7vYdYOiV64qQyppqXsslQcBjj9Q81RxPS+AogqZMdDYm
	9TWVIQW/ZChJ7YyyRth3DuwIkwznmid1ZxbqMUO0FNyEBSIsTMvCay+8J22/VMsy8ImPixwBAqsaL
	QZb/KSoExxevhYmKYU0LW+Bnp6MJ3RrWC77Kqe+9Moya01zrakl4zit1uQZULixoHNJdNamgxmoAH
	4jJONXHrYkpBly8qVZ+MwF2y02ISCRqJte+Odr9ELfYfnbkSD/a9N3GfcldgeS+YSVr2EVFCVB+a1
	qR876aAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQnL-005T7P-0Q;
	Tue, 05 Sep 2023 07:48:19 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQnH-005T6N-3C;
	Tue, 05 Sep 2023 07:48:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0D90D6607033;
	Tue,  5 Sep 2023 08:48:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693900094;
	bh=2aURxQk0M/bSZXU5lE37P2mi6JsUawbzSUa7gkm80LM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X+PNlFJYAEteHrrNiB/RRragp6wajJ17escCe0g4W/BR/GMsHPeJjEduzT17lnKTf
	 D1ldwHrCv4Fur/6kHXLezyZpeKOMw2KjM/pk62YIhRODaZNeQkqFmHxFZCD2EkzZuo
	 tGlSrFn/emry0UK30xL5fe/HKAUdz+OYPJlTj0ZUIqDdfGbpqJ0YHl/k3djLW+0Foi
	 V3ylpWUtwcd+vcjDt2WYakutUj+yrX8l4utoQE2Qe+nT4N0Yoi3CXwEIhnuen9Hwx1
	 9qlP/8l/T8QP12HXhNPS4RttDEc0s5ryGViVtR2NT6KLBBygw2Sb75n+oDk9bLIO1v
	 hjT+V7FgeMa5Q==
Message-ID: <6c089869-a933-f340-60af-de03781aad1b@collabora.com>
Date: Tue, 5 Sep 2023 09:48:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v17 07/14] remoteproc: mediatek: Probe SCP cluster on
 single-core SCP
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230901080935.14571-1-tinghan.shen@mediatek.com>
 <20230901080935.14571-8-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230901080935.14571-8-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_004816_160049_95DE633C 
X-CRM114-Status: UNSURE (   8.75  )
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

Il 01/09/23 10:09, Tinghan Shen ha scritto:
> This is the 3rd preliminary step for probing multi-core SCP.
> Rewrite the probing flow of single-core SCP to adapt with the 'cluster'
> concept needed by the multi-core SCP. The SCP core object(s)
> is maintained at the cluster list.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



