Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F69C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Dec 2021 11:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZSoQQlmG8y2vo80HIIMhQtsGakEYUsimKCSgqytgH0=; b=ckuOe/WWGqvYOt
	KKNgQE9JGR4w32VkpLkCGhrr61gaPPOFMLLg5AgiSWqcBzhS5BPVguyE+NNp7mBSfMK5GOwVgUfSV
	B3fg1Tu13TMKHCDoyr8Kq1fqaBh9QAMLD9hi5AdNxY2Y8HruFJTxtpHOuK+9PZNBMAXg2z5hK44L7
	lrQL663TTa8k9E9Nj5PyTM/7ykPCFriOnCAxpduM3aMaxYDcrq1Wvm6kJVruZG9mwF7RVZgfmymhV
	Youk1fX5+f3WoUVf1MOuppKTAKhIwT2hmuY4uiTBUDHeElWEZtLffak1F+1FMXwq6wK1ytlZTm9LH
	giHosvhcjUCJgEr6JbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mytvY-00FkAb-NF; Sun, 19 Dec 2021 11:00:28 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mytvM-00Fk84-Df; Sun, 19 Dec 2021 11:00:17 +0000
Received: by mail-lj1-x22b.google.com with SMTP id z8so11022668ljz.9;
 Sun, 19 Dec 2021 03:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=28WUq9Jt90oxX2or2ReiiYs2kHyyTZ89Ut+mmcfXAPQ=;
 b=MvA2FRT3P60D5yjezwKIFYMSfSHRZp5IRVxMk0BdJWl2zzxHNVkQuwPx184OZ/VIL4
 inJUvjLQNSa9mu40ePpg2Af/dAMNsQ2LYQ5kgf036j3CgQw65Bd3hBhudnTrSx/xr1AX
 7heIbvMCVnuesRNta2lfAUhZP80ZRAcoH7wvnixxNPaOOE47xOw5d0pYM3K8RKb5hHJW
 Q6JdH2vvV6T4bHIJQiGlGqlukSiOlhjDwiLY6TS0SxgIBoE6gIjsB9LMrTerZ0c6yjIG
 5IWDPvcwnqizBNACYxB67R81bv+3MusJOwhmbciukFs/ZqAwpA3Vo2TibijgUG1fKfgK
 oj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=28WUq9Jt90oxX2or2ReiiYs2kHyyTZ89Ut+mmcfXAPQ=;
 b=mfBs8L/ZIPNJBtFmrpO9ZBPVDB8xrwx+wKjbokCIZxAaOG+oWAumPhfF3H6wkffMjg
 zKz7hHAVu0clX1kAkysTD7O7O+3P7O+6ktBYpW1tNes6/mUz1DwVN9TgpphUVjIrMCvM
 zzag3tv91t4ts28hX56MFaEHDBk89b5vgUa55SKpUMLZPSrd+Cq18QAo5SvOj9Uajiij
 5ZULLvdrVobz29RkdZzCKpLIxFOVy3I9b2MUB6jkmLZrvNiHwaWPSjFpx79iIZVFHi6v
 cQ6yNKqM77Y0jgPgBao0ySsxed2V0i0iirK+E++YOdmWOWQ4wabmAcRqTuiNvj0S8fpr
 +aww==
X-Gm-Message-State: AOAM533lL+1dQTAfXRVjufVCQdIkNSNkywbnaBrbFIe62I9nNVk33auy
 KKZYhiyC9ukd3ozLyT4HtSY=
X-Google-Smtp-Source: ABdhPJy4q1W3IfUk3iv7+OV74YqxVPB6VWyBubwKM1rhmCigLlyhq+AHZfeU8BKn2WNBeKFGCEbnBw==
X-Received: by 2002:a2e:5c86:: with SMTP id q128mr9866205ljb.245.1639911613992; 
 Sun, 19 Dec 2021 03:00:13 -0800 (PST)
Received: from [192.168.1.100] ([31.173.85.16])
 by smtp.gmail.com with ESMTPSA id z28sm2223309ljn.77.2021.12.19.03.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Dec 2021 03:00:13 -0800 (PST)
Message-ID: <9c5417f7-3cd9-472d-5b04-f831135ffd78@gmail.com>
Date: Sun, 19 Dec 2021 14:00:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 3/4] usb: mtu3: fix list_head check warning
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>,
 stable@vger.kernel.org, Yuwen Ng <yuwen.ng@mediatek.com>
References: <20211218095749.6250-1-chunfeng.yun@mediatek.com>
 <20211218095749.6250-3-chunfeng.yun@mediatek.com>
 <64b9453a-84c5-8d41-26d5-698d1ae9d473@gmail.com> <Yb8MM2zL2Ecfzv1/@kroah.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
In-Reply-To: <Yb8MM2zL2Ecfzv1/@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_030016_519190_BB3D2D7E 
X-CRM114-Status: UNSURE (   6.34  )
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

On 19.12.2021 13:40, Greg Kroah-Hartman wrote:
[...]

>>> This is caused by uninitialization of list_head.
>>
>>     Again, there's no such word as "uninitialization" (even if it existed, it
>> wouldn't mean what you wanted to say); please replace by "not initializing".
> 
> We are not English language scholars, most of us do not have English as
> their native language.  We all can understand what is being said here,
> there's no need for any change, please do not be so critical.

    OK, noted...
    I was just somewhat upset that my 1st comment was ignored. :-/

> thanks,
> 
> greg k-h

MBR, Sergey

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
