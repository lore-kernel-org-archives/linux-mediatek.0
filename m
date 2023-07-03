Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F45EB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jul 2023 13:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7l1mEGg7c2wpLtTEIg3URr1mk98TJdhV2O1NAukJvQI=; b=eijNXFwCpZl8GCp/ZSdMSCA/NV
	OseatA5nmJfPsF7KdrW44fSL1m6sucBKww9YkQGxEpfwq6G9mkr4Ee6/qB9dhi6t0h1dUlTVnzReY
	tmmRICrFGrzI0tO79gyznoI95htI0wwEj/Oy5U5Ncz09xi7tTCdAqtmuHEvPBV2weN3Hp64PvT+fF
	KLPK+3RPLcd6RGXxNM4OA+QLAK8RiV9TZ5L5zCF9kpy7+omKWET7IUrtPW3gVDhxcKjM7Qq0sLQ8z
	qSCPFBNecLjQ9ZyEnK2ilK3wNTOTckMI4Hoo9Ph0GDDy83o6vSJfhSzBsgAXz7FYyguWq+FbzJGAI
	Kr4Rmbfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJUs-00AcDC-0Z;
	Mon, 03 Jul 2023 13:21:42 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJUq-00AcC3-0V
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Jul 2023 13:21:41 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3141c3a7547so4595806f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Jul 2023 06:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688390498; x=1690982498;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7l1mEGg7c2wpLtTEIg3URr1mk98TJdhV2O1NAukJvQI=;
        b=NYqYB036PphhzltcgbtW2Mjuv9ELS8lWeefntrR9E1udJA9gZc/2yZFwfi9n/nnEtx
         dJ6/p3kpW9uy2fLETLOx6ZdfgalJtgLC7d70TL4kxWUAvkz0gBgEauo9M7VEkuuYSjS+
         5pElzA5Aaq+BNK23Z2znzh4evK7f5u94wwc9/7fEHpnito1iNIVADF1lD2Y6Oxv3WSIT
         wxSmOv959JpRFeqPOoOWB29hqaM2j2m4Ofv4Zn6917VOQrwm5Uq8dDG1flHwLazerF1K
         SgQ6Ihs+c08Vjrsk/Illnv9oyRz8CHE2ftzvPF1SgThL3wYtkXEHj/axg8IFUL/SwkFH
         EqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688390498; x=1690982498;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7l1mEGg7c2wpLtTEIg3URr1mk98TJdhV2O1NAukJvQI=;
        b=JSTFVCiOL3TIZyc38fVEYx+cCAn6klUkNQw7Zarkkb/SxUanldNgdrBZ0Sqh/rxYZM
         JDnchqmttXRrG0fjuh7D6cuQ7jcHAU+u9sPxe0dudJ2/brVI9wnDY2T9/9lrZoNgg1Hq
         7SF1K1VAcnwH0C2SYiDbo9yQtCzmTH+ikw+Asc4376nxXRcWfgVVrOkTx11P9e14m7di
         1CpL5M80cHjt1svEgW65blq32UgcdYOYU0/7taDYDn1jxXK5eXJM5bHWUtdnSjaUFkZP
         RKLT5v0FOacWGyZpmSj+u7t9/TIytEvCfZ7r1BMLaWxsZODTcTo/5vF2Gi/cD7iN3uIF
         C+8w==
X-Gm-Message-State: ABy/qLYaPz33X9pST5jEgBvR3koAr45qzXmEA81ujS+LFjjW8V5pgYMI
	IblTxFSfapOFeQHh+Zka1EF5r50+mJLHdBv0E8k=
X-Google-Smtp-Source: APBJJlEs9WNGwAI0S53UjVmfae6omN0PjrMuyB8/IHEf1XsB8S+IOk4YEMy6SpzOvpWK9x3PC3a/RQ==
X-Received: by 2002:a5d:63ca:0:b0:314:2594:7b9f with SMTP id c10-20020a5d63ca000000b0031425947b9fmr7784226wrw.11.1688390498515;
        Mon, 03 Jul 2023 06:21:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w11-20020adfcd0b000000b003143add4396sm1182289wrm.22.2023.07.03.06.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 06:21:36 -0700 (PDT)
Date: Mon, 3 Jul 2023 16:21:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: jing.cai@mediatek.com
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] Bluetooth: btusb: mediatek: add MediaTek devcoredump
 support
Message-ID: <b915ddee-25fb-4072-b714-e1c97460cefd@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_062140_197731_B659FC48 
X-CRM114-Status: UNSURE (   5.69  )
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

Hello Jing Cai,

The patch 872f8c253cb9: "Bluetooth: btusb: mediatek: add MediaTek
devcoredump support" from Jun 29, 2023, leads to the following Smatch
static checker warning:

	drivers/bluetooth/btmtk.c:409 btmtk_process_coredump()
	error: double free of 'skb'

drivers/bluetooth/btmtk.c
   381                  if (err < 0)
   382                          break;
   383                  data->cd_info.cnt = 0;
   384  
   385                  /* It is supposed coredump can be done within 5 seconds */
   386                  schedule_delayed_work(&hdev->dump.dump_timeout,
   387                                        msecs_to_jiffies(5000));
   388                  fallthrough;
   389          case HCI_DEVCOREDUMP_ACTIVE:
   390          default:
   391                  err = hci_devcd_append(hdev, skb);

hci_devcd_append() free skb on error

   392                  if (err < 0)
   393                          break;
   394                  data->cd_info.cnt++;
   395  
   396                  /* Mediatek coredump data would be more than MTK_COREDUMP_NUM */
   397                  if (data->cd_info.cnt > MTK_COREDUMP_NUM &&
   398                      skb->len > sizeof(MTK_COREDUMP_END) &&
   399                      !memcmp((char *)&skb->data[skb->len - sizeof(MTK_COREDUMP_END)],
   400                              MTK_COREDUMP_END, sizeof(MTK_COREDUMP_END) - 1)) {
   401                          bt_dev_info(hdev, "Mediatek coredump end");
   402                          hci_devcd_complete(hdev);
   403                  }
   404  
   405                  break;
   406          }
   407  
   408          if (err < 0)
   409                  kfree_skb(skb);

double free

   410  
   411          return err;
   412  }

regards,
dan carpenter

