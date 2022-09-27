Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E19C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 11:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqq79vo2tVnb7DWxYvIOO20/WQLUXfNmmoOrqcnXQk8=; b=kTVcHVaa2HyE1fTu2HAuk9Sfo2
	hGuViW18MrgdL9d8UDvGiJwlPNkzF0p459M71VlbUn4xX3fQSgnPdvA/Q9lM3QF6SKeiT+LfvjC/R
	AK7WV4rOCRhWLkp5xRwXIBdXifPtfYYRGCaLJYIkGkjh+S6at9d1eYL/kwYFCltanV4cBGcbGWcYs
	idu/YiKYjrqU1KfCdebz9pQCfcCLj22Iu7GKoW/uTelsafOIKkvnFq5c4ih4Y8SDzmEa5sPb6EqYM
	qXrC4qv4DwxjPoxJO0U0C3GrVMInqqcD6Xo7R3+MDI6Vpgwkd6y1lIaHU4PIv8wGLpF3uYe+fnwCf
	BKWnQ8jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8QX-00A4Eo-0z; Tue, 27 Sep 2022 11:07:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8Q4-00A42P-J1; Tue, 27 Sep 2022 11:06:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 912AE6601F41;
	Tue, 27 Sep 2022 12:06:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664276791;
	bh=Eiys2MQDxTttwOrfkp9JGhDhEdlH5ShtSAZhdpDDjb8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z+v41NJC1P5ioKnnPVBdfziVIZ74LVXXqKuXbLH7UDQWo40GSo73D3OI6hTvP8M+c
	 KLOltGJCX/jITZeLuoSxfexmVgNVoX11SYuHIz9ivKNkk8SWTD7S4ZYGO8lVeiLoqE
	 iXvOBmfpd/ENZtiU9Rl5tEvCreh04WIsdocSV7KMRJ+B6T1Vifl/6GqiPkwPlLR1OE
	 DQ6IVlRY9qZQYQ6de9RmFz89DmurtMyUEWPsQO7y8BEThAMLxwmX8AVHB6XjyXwYAz
	 4p23fSDsAnBkLa8VCBg/UX7POhpfhrSo0p6PsfREZptpukw5viC+unUfNa/Qw+GkcQ
	 mei/F7kqzHhFw==
Message-ID: <a565ee30-bd23-beef-0c66-a60eb396e7a5@collabora.com>
Date: Tue, 27 Sep 2022 13:06:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 11/11] remoteproc: mediatek: Refine ipi handler error
 message
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20220927025606.26673-1-tinghan.shen@mediatek.com>
 <20220927025606.26673-12-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220927025606.26673-12-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_040632_801626_AC65A701 
X-CRM114-Status: UNSURE (   9.03  )
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

Il 27/09/22 04:56, Tinghan Shen ha scritto:
> The error message doesn't accurately reflect the cause of
> the error. The error is due to a handler not being found,
> not an invalid IPI ID.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



