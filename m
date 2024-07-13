Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013EFC3DA45
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jul 2024 23:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lc4elSgg3x5cvmXgJTU3aBih+0xvob/bX1S1mp6OJcA=; b=UFZycxOxWefmhPhCZ2Ij/6VzKp
	MK/M2+qDu23FMeDa04oiWIXXWTQBswECzMNZSN0S5tBkRyjwfIosJSRywTm/0zXzz0o776sT3miyA
	GUssdaYOnwkEToHq8PN4pyT5/75KF2NykpZjKT3EOjrp+IgT97h6dnlMlKl4CaxnbV2em983ALUEE
	j7g2lpwo3FXNXf0adtwvv4iy5YHcB9bOv+iFBwesSYT7Q4jrwETbGXHwE7LNGGgIP31FhS+N8gF58
	Dhii+5fHd/PDQA4hIdkxUKIXYDQiDwB+b2vDH/xuroo8ArJ5vKHq+zY6qxBw17wNObESieTUREWde
	91Fh608Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSmF4-00000003Oev-3hOC;
	Sat, 13 Jul 2024 23:33:26 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSmF2-00000003OeS-05Hm
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jul 2024 23:33:25 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-25e0663de76so1422586fac.1
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jul 2024 16:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720913603; x=1721518403; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lc4elSgg3x5cvmXgJTU3aBih+0xvob/bX1S1mp6OJcA=;
        b=dhW5fqSXYo+nfyq7wbUQ0vcdFt4fJYqSzjAeThTFHgZTFakw1QVkCNRS410hiHj/7/
         RkdAquNZ3Zrawj4vIjeY0HbLlNU7djHMyAcB1OFf8OLNe1mQY2AYmjPbZsH95YZW6mY/
         T0LFkIC+ZL/zo5B43XpoGoVQQ1SXNPzrImKRadAMyzRxaJk6biOvLMbqnDZqut923u0B
         E3PLK7QzO+0P45hC88hJivdLQ1ugqmWBic5fgbqRaz00z316kxS1Ni/TTv2ONqo8OqOs
         f5VACtiODKs0WdOBtXt18ztPXiZYtF9ueXg7unP7zbe3JidVUPBqws0jKe6OZ89XeRBQ
         Ytww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720913603; x=1721518403;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lc4elSgg3x5cvmXgJTU3aBih+0xvob/bX1S1mp6OJcA=;
        b=gUw7CVRVt10HNJfWSEago/zSAVScqEJ9gMMT1E/JjPTs+ncZSKIN1tDkuciszgwFPH
         pUaHuKP7ZgVNEE101c6I9LUGlzjb7EX2ahTY13BmVC6Tcb4pOD9vT4DXkj2VM+k5Ekub
         UJVqbF1P+7xB1OpVek6NfvWuYZVA622xeamQVjOPJRNbY6c9eEAOh7R1tqanGUC+acwQ
         1J/9AgXMQ7bX1abHEyUz+TDQXovBm9pmf5vqfPyR13db6mz79FV7olWM8vUYcN51TNOh
         WmCuG4W0sDvXZGNBiAJCX1uFtUKMNgIiWwhRvnONCEbRzJATJToKB1Z7wm2P/85QEu9T
         Kudw==
X-Gm-Message-State: AOJu0Yxk7xm2dBkwbDD9t0pGZS55jz9AmBhYRnaYi0q1X+XO4yQcIzOP
	XZ2MilyHzJQIefsZDefNhp44T06GJksDuTU59lObxR8X91IvsUlfy0G2Luoye90=
X-Google-Smtp-Source: AGHT+IFdyJXZj5Iix/ERI3+L6X8Gbk9U4YpVmRqC4YFZ32Tq1TfBpAZvIHGXdzLbgMkkgEzYMK3OTQ==
X-Received: by 2002:a05:6870:fb94:b0:25e:c7b:ca96 with SMTP id 586e51a60fabf-25eae756de6mr13628226fac.10.1720913602664;
        Sat, 13 Jul 2024 16:33:22 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1cb1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-260752a845bsm442522fac.42.2024.07.13.16.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 16:33:22 -0700 (PDT)
Date: Sat, 13 Jul 2024 18:33:20 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Wang <sean.wang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: mt7925: add link handling in
 mt7925_txwi_free
Message-ID: <baf461ca-4259-44d1-a078-413c41957afd@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240713_163324_245264_9BE07085 
X-CRM114-Status: UNSURE (   3.99  )
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

Hello Sean Wang,

This is a semi-automatic email about new static checker warnings.

Commit 44eb173bdd4f ("wifi: mt76: mt7925: add link handling in
mt7925_txwi_free") from Jul 6, 2024, leads to the following Smatch
complaint:

    drivers/net/wireless/mediatek/mt76/mt7925/mac.c:856 mt7925_tx_check_aggr()
    warn: variable dereferenced before check 'sta' (see line 852)

drivers/net/wireless/mediatek/mt76/mt7925/mac.c
   851	
   852		link_sta = rcu_dereference(sta->link[wcid->link_id]);
                                           ^^^^^^^^^
Unchecked dereference

   853		if (!link_sta)
   854			return;
   855	
   856		if (!sta || !(link_sta->ht_cap.ht_supported || link_sta->he_cap.has_he))
                    ^^^^
Checked too late

   857			return;
   858	

regards,
dan carpenter

