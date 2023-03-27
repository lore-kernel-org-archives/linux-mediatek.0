Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C32C76195
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtgFIInjb7iyrRAzffjjDhYfzRY8N3+iLmVvhlQhxy0=; b=v8Id8I2L0avO3KiVSwR0DrHALP
	BPpxXGEVA45UMHrj6reDSbfqk5hMtwF13+CH56JN2I25EXFwgwimuh8rKwhS8wpd0lA9MzwpPOD5w
	vCBhHy6Z+jDHxET5LfWIv6soyYJ0Sqo2/Za/sES9QsAwphLWmsry4WO0PkE5quemlQ6ovtmN2PLoq
	7QvZ3crMo0t98ch2lHb33WfE5wMIj9PgxbsXQhz3VcjY8P5eQdzK/ZX2KEzftplPLPEyMfTBrhj4C
	GTKzt2z3pZA+KFrMbFnMaqjeZT9hyPQtb8zZo+f9S6cz3a+D4bd5WtXUtMW0GWgPbV7AfhW2L2mFP
	8xdgoSxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgi3p-00AClT-1Q;
	Mon, 27 Mar 2023 08:18:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgi3M-00ACZV-10;
	Mon, 27 Mar 2023 08:18:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 49D4E66030B4;
	Mon, 27 Mar 2023 09:18:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679905087;
	bh=2E+31zGWciZzbNco4Iv4Sm3znwMEN8uECfV+WcpMeYA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IpUYF0y9HIU0RfVggcqh70OairrRcB3LondNY5uiThxvc9bpCb+iWWribeNPqkCjA
	 2/qMeYJr6y5HZdV1GgEtMwgMI3vUGVPOWypq9NXDJ0ZvyGvJs4l7h1Qm7yZJHB6i8V
	 PsW8SR1KKYHjHsSkzHpcQ6g3lTzaxg7TV5ZciYkJuPf75mZyv88yvdKdCTFcKO5MVV
	 Gkitkza6g5RroKBzkomnEeHX7E1B1nnrG3yVpNc+gMuu0e4T/DiHccrH32pWr0bz4k
	 GFllI4gQu8t8NyCvYoKzgej+boNXvv6cbQdxKSvEgPbqeEtNeleRW5nJnN6IEdWEzk
	 KkG77e8N1LavQ==
Message-ID: <74fbdb2c-8913-cac0-3e7f-2fde18890c0a@collabora.com>
Date: Mon, 27 Mar 2023 10:18:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3,6/7] media: mediatek: vcodec: Change dbgfs interface to
 support encode
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230327055315.13936-1-yunfei.dong@mediatek.com>
 <20230327055315.13936-7-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230327055315.13936-7-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_011808_486083_6A98C38A 
X-CRM114-Status: UNSURE (   7.04  )
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

Il 27/03/23 07:53, Yunfei Dong ha scritto:
> Extend dbgfs init interface to support encode and create encode
> dbgfs file.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


