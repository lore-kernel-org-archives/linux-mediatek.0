Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50C3C6FA86
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 07:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02557o6QWwGoA5/orMYBbco61qHxyewTQ7Y8qKzdwOg=; b=JZfVDuqhXbwyNJIVQLv9OPCxKY
	bmkSeOWqkqiiaxTu4UsuaercFerdkcMHxs/zAsQ4ZBaWSas0q9AzpHSqEoDn7CGFJsW/zR0bFn9M4
	jTaI0Ls8ryECuh3e0oko7sXiIAimhwUlGF1vetF6bBeKtIG51NBmQZUuOMgoJOYWwAOEbdV2tI8Gy
	4wFAKf5Vv/hCfBnfHhskf0FqySqEFJRaiGDclgtDfQ2ru8noAwkc8eHXQfwXxb3xtfR+jkk+SShCd
	Za5rvl6OSvvo/+2YWOyTnR5u8PDqDyfdGAxd+0aCvO/JyEWxykUkiPfWt2tSu+UjhK+hzoNKrf+3d
	kZd9CokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY0ff-003mWV-0m; Tue, 13 Sep 2022 07:49:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY0fb-003mPz-4R
	for linux-mediatek@lists.infradead.org; Tue, 13 Sep 2022 07:49:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4DBC86601FFD;
	Tue, 13 Sep 2022 08:49:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663055359;
	bh=mD9+p5CeWAabFjztyVRaFCcTYIBpRki8qYznPTDJVbA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m0lJiLGUXAo4Quv7c6czRS5bVuvU8uC2f1jClP6A6drPqz+deYjO9gv0HMKBujiTy
	 d9tgiMfaLaFexlr0QHL7mF5M79PHGzLZOOhj9eIxJbH7HjlBpx6nobxm1eNubGmTYu
	 F5WwQKqa5gvdT/S8NLu22a6ZpaZyabHgP8iJL7zpZjg03AkMjwHY9IzsyTtwGju/AZ
	 60xSLZzDThQbGPliZ3Vil9fbDcE8tF3n52YWrYA2m8sd2XtdJ9dkCvsVe4uSe8VhbY
	 AbVhLdTmFG/xAvtAgg+p7/VE0ZnBkEWF7Mlx+rlK6gS41Pw/ObwXa/9v9zxREaowyu
	 L5AFScQjtX3dg==
Message-ID: <07016e51-a5b5-a350-cad2-b9fcebfe3706@collabora.com>
Date: Tue, 13 Sep 2022 09:49:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 3/4] Bluetooth: btusb: mediatek: reset the device as WMT
 failed
Content-Language: en-US
To: sean.wang@mediatek.com, marcel@holtmann.org, johan.hedberg@gmail.com,
 luiz.dentz@gmail.com
Cc: Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, ted.huang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
 frankgor@google.com, abhishekpandit@google.com, michaelfsun@google.com,
 abhishekpandit@chromium.org, mcchou@chromium.org, shawnku@google.com,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <43b68b1f48c20b1dfcd7e6663c3dcb38e4e0648c.1663020936.git.objelf@gmail.com>
 <a432abf4cf95e93783864b27bafa53d45bdd5212.1663020936.git.objelf@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <a432abf4cf95e93783864b27bafa53d45bdd5212.1663020936.git.objelf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_004923_587593_6C8DDB84 
X-CRM114-Status: GOOD (  14.95  )
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

Il 13/09/22 00:18, sean.wang@mediatek.com ha scritto:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Reset the BT device whenever the driver detected any WMT failure happened
> to recover such kind of system-level error as soon as possible.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

This looks like a fix, so you probably want a Fixes tag for backport.

Regards,
Angelo

> ---
>   drivers/bluetooth/btusb.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 653f57a98233..dc86726c8271 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2576,6 +2576,10 @@ static int btusb_mtk_hci_wmt_sync(struct hci_dev *hdev,
>   	data->evt_skb = NULL;
>   err_free_wc:
>   	kfree(wc);
> +
> +	if (err < 0)
> +		btmtk_reset_sync(hdev);
> +
>   	return err;
>   }
>   


