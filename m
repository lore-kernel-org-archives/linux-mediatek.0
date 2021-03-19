Return-Path: <SRS0=VEyR=IR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3066C433C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 18:35:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72E8E61980
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 18:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72E8E61980
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sS/5aTcmHcC2Rw0AeYDA+THyzwH8KKs+DxWghLr2Ed0=; b=c69wj4DIsQH9icHYjoEpT2sm1
	kwhSjNDHQes7rMoQksPY3rFheLYJm6iKD3vIWonw7+Z6hQWAhBjLal47i7WnxROstpC3wA4+zZMxQ
	qqWRNihB5M21G4SZKp0G4J4Sz5RgdQCztz0JHJp+o1vAalD+z2toKDaG2gUzI9EQEka6NTQ2sst/u
	RSJEMJi9aPj4PAg92iCOkoML0O2Nxye8u1D/YkTXXfX62uOYsWRZsevAl2XV4Gz6o3JsOSK0pme0D
	DEWLw2U3GcaShmdtWEX7416A2lttgpODcTFV3xoM0elYBl9RG9QtOlqBZxnxduwSboZMaABMgFzKK
	Ts1uVW+Ww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNJyA-007xmU-0n; Fri, 19 Mar 2021 18:35:34 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNJy5-007xka-QZ; Fri, 19 Mar 2021 18:35:31 +0000
Received: by mail-pl1-f176.google.com with SMTP id w11so3357498ply.6;
 Fri, 19 Mar 2021 11:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xQw+L3RNfqCsT579pHnTD6SwVA6plQagWHOVeC6fOqA=;
 b=dofwWwUYwmNlDcYkHwuCYZhzATzGHwVic/WBRBb5287RjshpnbWB0zMhouSmYr/AOr
 074L8OXHhBJG6QBSbpctNXHhBqQZf5aRMqqGzlOaRJaUogq06PdKsE21Y56PMsOltWac
 AP2wcGesbso9OiCRx5w2ywGA293tV/7CX207wJUzxVS1qAXpLEUWCWiQ12e4TTtwgYnc
 7U3jfaBLeaHj51Wjz8ZwZ5UhOSaBCS+gIS7WaRsfjZwCM5WeypnBB8yzCoqnQ2o+Q8dx
 A6ZjyKuhFE9gpxeI0OB1EPTFRlQoTKj4yWYombSVI8nkiJbluT8Ob20yLEuKxbtn1qI5
 WBmw==
X-Gm-Message-State: AOAM531QQ+r9I7Lzd8zKDIbwNn3s2mlw0B76qZqBMLyxR4SU4WWD5uqs
 hxNL8Gi4+AT0ZS6tXTv9ne9LbqtNut1uQQ==
X-Google-Smtp-Source: ABdhPJzFo7QHStjFhBxDOIaDuwYNxhKN1zCo26bd0Gn29vucjEp7hfSfrzJVXYZuNWDn7lAuUVKFfQ==
X-Received: by 2002:a17:90a:c201:: with SMTP id
 e1mr10961474pjt.30.1616178922687; 
 Fri, 19 Mar 2021 11:35:22 -0700 (PDT)
Received: from [192.168.51.110] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id f20sm6380016pfa.10.2021.03.19.11.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 11:35:22 -0700 (PDT)
Subject: Re: [PATCH v12 1/2] scsi: ufs: Enable power management for wlun
To: Adrian Hunter <adrian.hunter@intel.com>,
 Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
 martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, Pedro Sousa <pedrom.sousa@synopsys.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Stanley Chu
 <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Wei Yongjun <weiyongjun1@huawei.com>,
 Lee Jones <lee.jones@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Satya Tangirala <satyat@google.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>
References: <cover.1616113283.git.asutoshd@codeaurora.org>
 <56662082b6a17b448f40d87df7e52b45a5998c2a.1616113283.git.asutoshd@codeaurora.org>
 <88730ac9-d9c5-d758-d761-8c549c488aab@intel.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <ed3b5ad6-4396-d861-9bb2-40c05f4a8ece@acm.org>
Date: Fri, 19 Mar 2021 11:35:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <88730ac9-d9c5-d758-d761-8c549c488aab@intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_183529_933975_4D7A41AE 
X-CRM114-Status: GOOD (  13.84  )
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

On 3/19/21 10:47 AM, Adrian Hunter wrote:
> It would also be good if you could re-base on linux-next.

Hmm ... my understanding is that patches should be prepared on top of 
the for-next branch of the maintainer a patch is sent to, in this case 
the for-next branch of 
git://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git.

Thanks,

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
