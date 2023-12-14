Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A5FC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Dec 2023 10:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fp1d+CKyQPNoIjDNbR+ewORGkHeCCmM/B8Rn1Q/unhg=; b=LmaXjGDhfGgUpwPj4ipp9Ek6y6
	yFxQxdtHTDP9hWtrB0kUziKNjXZ2AfWZqg20S6q59yEGJ4rN3QguiU5mu62/u/fShsS1LdSjRd7OH
	W3/X9iKc/gbWyWK2eVyt8dfPrmWeqJS8O+ridrY4odmKs1t9w/IB0gCxeXaZd+QGF5udK9/3KJCe7
	gyGF0LEye/hpkP/IUTZvwznpI3RrA/auf2YxVYAOVuTBUvfWOCgyNbPaUrkl/ruJkFAvpytjFeOjF
	9LP0PnLsasUCFGON2odfxaEO9kyCeq89BCMBPPZ/kyelLzMp8PgUX7qegLfeLSJup3sDzVz0XVVZe
	CZu8uIyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDirN-00HSx6-1w;
	Thu, 14 Dec 2023 10:22:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDirL-00HSwj-1x
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Dec 2023 10:22:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c48d7a7a7so37183685e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Dec 2023 02:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702549346; x=1703154146; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fp1d+CKyQPNoIjDNbR+ewORGkHeCCmM/B8Rn1Q/unhg=;
        b=Hh+YgSCJjAPjciOtK2jo17HzneUJlDc/HSLP5GdEbgluSfNrA6TX7DbRX4zsuaggVJ
         D23skzPrbL494ekcZcDV7v+clCbLGjRLPXICPsPD9E7SXmel83HljpipmxEI8VZIQWzQ
         CBf+qKGLWgouSd9sii26yjyypchVAG64R2pKeOLOWBFejOwo2BdBoz5aJFOHcJQ0oCb8
         vcQEfQ8p6QtDvaBBikrpFVYoOw2vGUUVJSY9k/H1/fCmMkL5WdC9zCnvkQdd1Lf+ypaP
         guR5M2R2yMedf+5h2zm0PRpqAi8nsjBsDRvL/Lh5wk22vOcYaasLQHQzlv+anEPnqvwb
         ZWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702549346; x=1703154146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fp1d+CKyQPNoIjDNbR+ewORGkHeCCmM/B8Rn1Q/unhg=;
        b=nkHZzPz49uweJ0/rn/T5AwMOucz4UY1/szcAzLAt5D8BwtC1Nd+OUAx4o4oCDDQ0lB
         OUugrh/2ZuQd/99Mx5NNAEkiiueMihw6i+YbxWr4tVhZR0gc7C6WWVKcwSqmdXj7ilgP
         1LHM2u91mYciqv5S8tB1mTok4PHiCeOGwCKH/7RkLFndTgYYvR+0jfzyJ+SJy75TuEdu
         +L23isNq919mxbO+AASwijNcK9pCJy/tP70Jsv7vHE7R7zeWwiPCfuSJlJiS4jRvMBYA
         q+9aEolMQWCoT+j2fEp9DhB2kP66L6tBZRlDgLLQ8wx/kf8gYeh3ZKMSfvUsK9bt/Ynn
         cyXA==
X-Gm-Message-State: AOJu0YzJa6WBCldoW4mC24h5V9ax4Qx7OMftKQeFNioSQlnq1sLMUPBY
	sDZrsLu1d8VJGdp7cAhqLBI1Yg==
X-Google-Smtp-Source: AGHT+IGzq9LLPmSNCTgriJpxqSqtep05s898zngmo1cC+R8cZnekkhe4Hua33rmwUJhqwgbzXz1hHw==
X-Received: by 2002:a05:600c:3ca2:b0:40c:50d5:f7a6 with SMTP id bg34-20020a05600c3ca200b0040c50d5f7a6mr2639429wmb.121.1702549345750;
        Thu, 14 Dec 2023 02:22:25 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id fm21-20020a05600c0c1500b0040c03c3289bsm24239700wmb.37.2023.12.14.02.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:22:25 -0800 (PST)
Date: Thu, 14 Dec 2023 13:22:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: jing.cai@mediatek.com
Cc: linux-mediatek@lists.infradead.org, linux-bluetooth@vger.kernel.org
Subject: Re: [bug report] Bluetooth: btusb: mediatek: add MediaTek
 devcoredump support
Message-ID: <7c2608ea-1637-40f7-a84b-2e20245c00fc@moroto.mountain>
References: <b915ddee-25fb-4072-b714-e1c97460cefd@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b915ddee-25fb-4072-b714-e1c97460cefd@moroto.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_022227_670036_29CE8636 
X-CRM114-Status: GOOD (  10.85  )
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

Ping.  Let me add the bluetooth mailing list as well to see if anyone
knows.

regards,
dan carpenter

On Mon, Jul 03, 2023 at 04:21:32PM +0300, Dan Carpenter wrote:
> Hello Jing Cai,
> 
> The patch 872f8c253cb9: "Bluetooth: btusb: mediatek: add MediaTek
> devcoredump support" from Jun 29, 2023, leads to the following Smatch
> static checker warning:
> 
> 	drivers/bluetooth/btmtk.c:409 btmtk_process_coredump()
> 	error: double free of 'skb'
> 
> drivers/bluetooth/btmtk.c
>    381                  if (err < 0)
>    382                          break;
>    383                  data->cd_info.cnt = 0;
>    384  
>    385                  /* It is supposed coredump can be done within 5 seconds */
>    386                  schedule_delayed_work(&hdev->dump.dump_timeout,
>    387                                        msecs_to_jiffies(5000));
>    388                  fallthrough;
>    389          case HCI_DEVCOREDUMP_ACTIVE:
>    390          default:
>    391                  err = hci_devcd_append(hdev, skb);
> 
> hci_devcd_append() free skb on error
> 
>    392                  if (err < 0)
>    393                          break;
>    394                  data->cd_info.cnt++;
>    395  
>    396                  /* Mediatek coredump data would be more than MTK_COREDUMP_NUM */
>    397                  if (data->cd_info.cnt > MTK_COREDUMP_NUM &&
>    398                      skb->len > sizeof(MTK_COREDUMP_END) &&
>    399                      !memcmp((char *)&skb->data[skb->len - sizeof(MTK_COREDUMP_END)],
>    400                              MTK_COREDUMP_END, sizeof(MTK_COREDUMP_END) - 1)) {
>    401                          bt_dev_info(hdev, "Mediatek coredump end");
>    402                          hci_devcd_complete(hdev);
>    403                  }
>    404  
>    405                  break;
>    406          }
>    407  
>    408          if (err < 0)
>    409                  kfree_skb(skb);
> 
> double free
> 
>    410  
>    411          return err;
>    412  }
> 
> regards,
> dan carpenter
> 

