Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C623CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 10:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRZbYPJeKUp/VvYQQQYXuqCv9mcyXKRTH9C58F8/mc0=; b=spKWvItvCfcvao
	5h05165nvTTzYdAYDu7LmL5NlN3XDADGE571vxmASKrpwBuB1qlng8nwY4NQ3IM0TneR8ntcKkJUB
	zCa8K8NhclXr96hEc5HteFs9xFNDV0bJaqiUMtEhZxNRCQmFK/6Czj6ZEeftguva6slw1xzUcVNJT
	3KiujIBwEW+XeBxNgjlCkrYyAhPENp1HWqVQ7r7rUz6TQE+WzVtRL9KuqX/RJEN3K0a9dK/KT2f7Y
	wp/DEJl2cS4rWOBmyb3SOjw9ZFt2IuObIofqROuU7SLq3AJV1g5o8HRfuD2U0qbyy+pOpXO4ukmBF
	lglqET0sKx+KfvopvQ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYyZ-000gbn-9I; Thu, 03 Feb 2022 10:04:27 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYld-000aLC-F2; Thu, 03 Feb 2022 09:51:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B396A1F45310
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881864;
 bh=JTkyG0VtgzUZdehkshEy/dIoTYtvqxNPnBCvRzk9B/k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HDCL75P7N/5OuXBAnaeW7nXLNA+2OxceD5nmX/0qsOZDX3sbiZ2hVufjWeUUOT+2d
 bNdDLda7DZb5FzFVSrUYawX4sc72U6uUpdaOLJjX7iWpxnUyQrCZuczGEcf6oM2cto
 A7WDo3Q6A+Hf6a8CfudDGPXIewUWBvVvEeAdtBco84L1uVbIHuz0bGLgiiG6/o98X6
 dRGDIP54lc07XgHlBa6jh1a8x/R9NksW2RXDos5bcjfFInIUtW+VOf/d4svx5CvxFD
 MlNW7XJdRxvQ90nWPE5kjxb28/eYXS36DOcd5wqtUXSHtca+eWzV8u3enCVYXvVjo1
 Y/XbsstPPkOFw==
Message-ID: <66fdf2c7-e723-beb4-e9a5-9b87998d6eeb@collabora.com>
Date: Thu, 3 Feb 2022 10:51:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 04/31] clk: mediatek: gate: Implement unregister API
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-5-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-5-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_015105_686703_CCDB2249 
X-CRM114-Status: UNSURE (   9.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 02/02/22 14:48, Chen-Yu Tsai ha scritto:
> The gate clk type within the MediaTek clk driver library only has a
> register function, and no corresponding unregister function. This
> means there is no way for its users to properly implement cleanup
> and removal.
> 
> Add a matching unregister function for the gate type clk.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
