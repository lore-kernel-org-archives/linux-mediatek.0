Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D4BECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 22:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFF2lCYlEtGBcqj2aYJNGrAsisA/ypCs1g/YrKPkZYA=; b=cYo/WoQ6klpUqjEOl4vrIq4qvf
	KTcEGst5JbKZ5SvUfPu7w6eT+i28ifGeygxbtilZ7GmWubGwAu0wOQHHwEKy6wVTiXoVck0caKwRD
	XGklRfVkNv9D3HX0WBDQTDmy+PndyAlzTl1xObit+oHzq7wD7ZqkM1DgYHxONceqDDPJ4XXNqADTR
	MK8LXZc7ewtDqK+9pT6TZ/BOjYIi8qcbZH0ZAUf6TbYmA0StorBmCYtePfzLryeEOqvbFMycwxp29
	ovOga2tIKqDLISXosQtPcZwnrzMCKx/I42h2cKjuOkqdNTrBwILplAUlj5S8dBLEJgO18KtejXk4e
	nTiiUqxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYb8N-00BXMt-V3; Wed, 14 Sep 2022 22:45:31 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYb8L-00BXLu-06
	for linux-mediatek@lists.infradead.org; Wed, 14 Sep 2022 22:45:30 +0000
Received: by mail-lf1-x12e.google.com with SMTP id w8so27476774lft.12
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Sep 2022 15:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=zFF2lCYlEtGBcqj2aYJNGrAsisA/ypCs1g/YrKPkZYA=;
        b=L7Da3Ihe9ysWH419HKN8UZD8WdHltmVwGyORUc/Xf8VEyR8J4EXkaKfbz2ivXiXnwG
         102SNzJS1UljweZ6+J5Qof8DmYtntbvIh2+wlbDYZLtF9CuNxnqFjdkhE6A6ksiEotcH
         83ml9SovYJF+xHAIjLOwTax8fRAtcgUmzPMD95Z6Awfbi8g2bIW4NGtUNEgPK370UhCr
         tVE92vKagUCv0OBs88rf6t8WkpsPi2Bvd57oHLOny4W4Svz8FARLLEGxoeqoRTLUfn7N
         0xXFRfZqDtj+cxKR3FCGe62YMoO3d/Y4DxBjt5zVeC/gsCQsS03zliwt5zYZP5pqnRy4
         CyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=zFF2lCYlEtGBcqj2aYJNGrAsisA/ypCs1g/YrKPkZYA=;
        b=4mXfyN7BzJfwzCNZxxkpVo0BDztsRWUCItCVBx28VS9gV/OQNfP65+GmGkm4m6sVOd
         JXv/s7VJLUdhhv6C8QsgklAUdrYCtr+V/dp7p70cV6e91xYdisoDMqtFLM4AxG25kFDG
         ULsk3+bbkUrBu1p34zFqs84erP/ixyc8uDvTCiPnU7yB7ZkT2lnORVWTGNMCxTWgKJnP
         9cz9Vp2yMmPiU+Lm/ORJVHxLW7xtxmBOeYerGXfP47zD4A5mcVaaj7PpTuhIXKsDcN65
         2yYb0Y+s3zYmOzO8xTfYMOBs7pbqIexhsmbxz+jT+HY4hmPbK/N4AcUJqdR32+BdZM1E
         tKPQ==
X-Gm-Message-State: ACrzQf2O2C0ksYEO9KVTvP1atQZ+9XruUNG0wbatL7kXUm81iX1fiaxy
	UgN1uaWgQt/oevsgm3YoGqUZnrYjDmaYvR1yBvc=
X-Google-Smtp-Source: AMsMyM6SCeXeYYoK1cu55dFuBxWNFB6ruywGaz6zlJkrpy1QCR8r2NmbIuQhd4neJWcbDuAgQ8Zh+vkDiNTz5D/FfOs=
X-Received: by 2002:a19:6555:0:b0:49e:7d52:a4ca with SMTP id
 c21-20020a196555000000b0049e7d52a4camr643616lfj.198.1663195526049; Wed, 14
 Sep 2022 15:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <43b68b1f48c20b1dfcd7e6663c3dcb38e4e0648c.1663020936.git.objelf@gmail.com>
 <a432abf4cf95e93783864b27bafa53d45bdd5212.1663020936.git.objelf@gmail.com>
In-Reply-To: <a432abf4cf95e93783864b27bafa53d45bdd5212.1663020936.git.objelf@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 14 Sep 2022 15:45:14 -0700
Message-ID: <CABBYNZ+Z+BApMOPEgVBxf6j0sTYFE0tH6Eab-hQW8FKVFqfvqA@mail.gmail.com>
Subject: Re: [PATCH 3/4] Bluetooth: btusb: mediatek: reset the device as WMT failed
To: sean.wang@mediatek.com
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, Soul.Huang@mediatek.com, 
	YN.Chen@mediatek.com, Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, 
	Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com, 
	Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com, 
	ted.huang@mediatek.com, Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, 
	steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com, 
	abhishekpandit@google.com, michaelfsun@google.com, 
	abhishekpandit@chromium.org, mcchou@chromium.org, shawnku@google.com, 
	linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_154529_058944_6F6D9439 
X-CRM114-Status: GOOD (  17.32  )
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

Hi Sean,

On Mon, Sep 12, 2022 at 3:18 PM <sean.wang@mediatek.com> wrote:
>
> From: Sean Wang <sean.wang@mediatek.com>
>
> Reset the BT device whenever the driver detected any WMT failure happened
> to recover such kind of system-level error as soon as possible.
>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/bluetooth/btusb.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 653f57a98233..dc86726c8271 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2576,6 +2576,10 @@ static int btusb_mtk_hci_wmt_sync(struct hci_dev *hdev,
>         data->evt_skb = NULL;
>  err_free_wc:
>         kfree(wc);
> +
> +       if (err < 0)
> +               btmtk_reset_sync(hdev);

Doesn't reset itself can fail?

>         return err;

It would probably be better to reset on error at the caller IMO, also
in case it fails during firmware upload does reset even work? Also it
would probably have been better to have its own file for vendor
specific commands like this and use btmtk_ prefix as well.

>  }
>
> --
> 2.25.1
>


-- 
Luiz Augusto von Dentz

