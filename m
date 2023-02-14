Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4D9C61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 10:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqZzy7NMW+SvrMVIItVPXW8SthdXoO4+qH3afEvgvuQ=; b=A225jhjXhlVLqd/K0fBL3t7KQn
	p76Lz3wRyD/GPj9Wx6liKe34y48EYYnpN2gfttfb0DHi1fNtTGpSa0MnBaDTpfjwcAVlyAJSIsb3D
	G/WhtOO3gkWQSb2h7Y9bdUMDvvuvv8jizkph6yWT5m5a6W175KnIpLo0PhQRJcSvbHGbGUoQzpPP7
	VaZiviJxZ/NFCbBXbr623jbMxfwlpLsyu6AU40j7AWLbElcWok1Cygr4J0zKlrSsmSFImMYvys9LI
	ceKIeDoI+Fm2uyPfQOSfAZZdduVkRfnYj7fxVf1smKC5RS0Xh3dy6k1GvZbMDxy4reMXaqjfmAX9e
	/WJU3CFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRsHb-000veh-5G; Tue, 14 Feb 2023 10:11:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRsH7-000vKS-E5; Tue, 14 Feb 2023 10:11:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B5289660216A;
	Tue, 14 Feb 2023 10:10:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676369457;
	bh=Nz84FU88SiQNcVV2Xf8ERsDCZvoj6BMjNkoLM7HSosA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UBhAcz9eTI6cj2F7o6lSc4x0J9OIlfSr17kGw6C414a3os9jwmS/5th+5VNALUB+l
	 +EjXQ9vcy88KDwkniChABlIBIdZYt5yjnCaXXGicdbKhXJH969hylK0Bah9oIjvw4G
	 VIz14OnxnSzuoyV2he3Ugrt/D1KNTxFVFXL6LcTy0E3s9hAlvLvyqfGswYpDFAzrlQ
	 N2o5pm14kwddOJZFil2POcgrfzinQxGyEc92PS26OXNuMN0XlcQm/uJVN8+t2hf1wI
	 SQUU1///k0TXL9YNHb2TU3NPT+/UUnzXwVlPpvInyLI4CmvouGwfKqhg9DT2aNQnvB
	 xmxOzIHFK4mbw==
Message-ID: <b0331a71-e316-28df-43bb-790ec748fafa@collabora.com>
Date: Tue, 14 Feb 2023 11:10:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v4] media: platform: mtk-mdp3: Add missing check and free
 for ida_alloc
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, mchehab@kernel.org,
 matthias.bgg@gmail.com, moudy.ho@mediatek.com, daoyuan.huang@mediatek.com,
 hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230209135245.11203-1-jiasheng@iscas.ac.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230209135245.11203-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_021101_641452_7298C53E 
X-CRM114-Status: UNSURE (   8.45  )
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

Il 09/02/23 14:52, Jiasheng Jiang ha scritto:
> Add the check for the return value of the ida_alloc in order to avoid
> NULL pointer dereference.
> Moreover, free allocated "ctx->id" if mdp_m2m_open fails later in order
> to avoid memory leak.
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



