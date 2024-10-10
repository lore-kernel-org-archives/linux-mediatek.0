Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A019D2444F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 22:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttbGIV1OtP6Y+L+hzzhjHcgo4Ic64lUH6bhnz6qvucM=; b=kXAO13kUTzGQgRmna/I4oAetK3
	mia9PDT4XDJs0O0bEuJrdUf+836TMA9T7dX8TOdy4CE3UdqQUQj21PMWV2eUBBVRIDJrDc3+eYA5k
	RFvFtZJGh8bJaVhfQvG+VTyneayxU/62CoX4RnkPZiLIRZMVBbFntzI4j2sP0I9pW/BghX5w8zVe1
	lN1BuNdh1ZgWoqBk/b/d8fG6DlQZBRQEFF5dmyHRbog1c3cY7KUriHGZRDdrf0KexczvkGTLKO/tc
	paqSFF/F/dK2jRczSXxXnsfphBNctJvWbDl1FAea1NkGMhO29jL4TLAxrJF7TDLwMbtCL2fv8HwXJ
	7HKC0VOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz1Wr-0000000EWu2-2CFY;
	Thu, 10 Oct 2024 22:21:05 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz1LG-0000000EVOR-0PLI;
	Thu, 10 Oct 2024 22:09:08 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-37d4fd00574so631386f8f.0;
        Thu, 10 Oct 2024 15:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728598144; x=1729202944; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ttbGIV1OtP6Y+L+hzzhjHcgo4Ic64lUH6bhnz6qvucM=;
        b=OEf2kqXkpiJdK32vzqzKbVrFjPdmhPfzUPUvFM58hYGeac3s35PzTYKzePCvYVBEnB
         nzJonTwBizPV1cdr/SNBrMJ8WzOXYTOr6bfV+tyEPzeajxoRzVah8GpC1XLWhXpCHR2d
         iogVrdjIpLFjzljk1RMQdF6e8QBU5avp9w7UTpy3Aej7cjg1DiWXgQ3AZFiz9ncjNSE6
         jUqPp6a3s3MiDVc4TJmgL0n94aK1PsB0SUEjr3ZGYLfg5Z4tf1LDegPWPkUl1tr1Udlz
         cx64EmEJ1q4q2NrTkriEV4LE+Zq0R2E5dgX925haBAXIPZptExfKQXseCrb5FzmDW/g5
         Ik3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728598144; x=1729202944;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttbGIV1OtP6Y+L+hzzhjHcgo4Ic64lUH6bhnz6qvucM=;
        b=mH3hhPaB6gePYTfXAvkJ5Ka3AwPgtdnB9hbmv3WNe97HjSeykinDlfvOJavsN7BHti
         kf2YlSLxWlOqwhu5Y334kjKe0jG5/CFfWwpXAmaNPeRHYCUWvMiFNhctVhfgbgCQ0IQ+
         jnWLz+7s7bYw/VLSXizLc5KqGX8uHOLUrqro271kc1b3iZhrqJyPcl9MyE3+KYls3B+q
         y69SrtE3qAJs3/A9eXf2ls85vjZX7sxL/yiqQryY9KMIRS8sF7MeSmzJyvxR4pRpD4vQ
         9PBroZ24rKi13HSOtlUu/iLRfSqwG6u/HwZGvwMhcZVo30Z7eQKITfvN4wsKGqFk09Rm
         g3sA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+UMGu4TG2nr9/XGLud8/7SJ6SknYKfX8ns+E9guaROT8CNc7m6tZnE9eyoUsSyOjIt0DX06zTbPjQU0rMcD8@lists.infradead.org, AJvYcCXbsSEn7c/t07ab70eW3qJ2ZBTeA/Pwce7aQwFRCL/Hwk94LNO+dvP2QDJROR4FdeCs2pbUq9HqXqlqI2+kZ/A=@lists.infradead.org, AJvYcCXhfTj0PqXxP+z/Akls7rcK6anIbHyzQLXskj65ym5gTTqOoGnBlrgE3wEhkLg1VnESiHojNszYgLaE2j3RI/0Cnw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3yjdBBF5SFsWpeCbTM0sd49kwtB7yHin52m4wPkvSajxG1TMz
	K337BrvR2/0i12g+TPbUTn+mUKZWkM4sNwoEWltfQqDnKJhKqjRE
X-Google-Smtp-Source: AGHT+IHeSJFBVDM1SbcoY464K/ygl3HCvWV7h/IxMrNG/Ut2dgNjnOJVa/rz3Jta9HcTAJ32IG2XeQ==
X-Received: by 2002:adf:cf03:0:b0:37c:c9bc:1be6 with SMTP id ffacd0b85a97d-37d48194896mr3864214f8f.16.1728598144208;
        Thu, 10 Oct 2024 15:09:04 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:3d08:841a:562:b7b5? (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6bd3dcsm2451217f8f.42.2024.10.10.15.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 15:09:03 -0700 (PDT)
Message-ID: <9a85e6bb-884f-4fa0-b198-bf7707af76c8@gmail.com>
Date: Fri, 11 Oct 2024 00:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] Input: sparcspkr - use cleanup facility for
 device_node
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-6-ebc62138fbf8@gmail.com>
 <20241010214348.GD4017910@ZenIV>
 <22e55eb1-8aa6-43fa-8020-d18f9f6aa6f8@gmail.com>
Content-Language: en-US, de-AT
In-Reply-To: <22e55eb1-8aa6-43fa-8020-d18f9f6aa6f8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_150906_174398_6A62B224 
X-CRM114-Status: GOOD (  23.86  )
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

On 11/10/2024 00:01, Javier Carrasco wrote:
> On 10/10/2024 23:43, Al Viro wrote:
>> On Thu, Oct 10, 2024 at 11:25:56PM +0200, Javier Carrasco wrote:
>>>
>>> diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
>>> index 20020cbc0752..bb1c732c8f95 100644
>>> --- a/drivers/input/misc/sparcspkr.c
>>> +++ b/drivers/input/misc/sparcspkr.c
>>> @@ -188,7 +188,6 @@ static int bbc_beep_probe(struct platform_device *op)
>>>  {
>>>  	struct sparcspkr_state *state;
>>>  	struct bbc_beep_info *info;
>>> -	struct device_node *dp;
>>>  	int err = -ENOMEM;
>>>  
>>>  	state = kzalloc(sizeof(*state), GFP_KERNEL);
>>> @@ -199,14 +198,13 @@ static int bbc_beep_probe(struct platform_device *op)
>>>  	state->event = bbc_spkr_event;
>>>  	spin_lock_init(&state->lock);
>>>  
>>> -	dp = of_find_node_by_path("/");
>>>  	err = -ENODEV;
>>> +	struct device_node *dp __free(device_node) = of_find_node_by_path("/");
>>>  	if (!dp)
>>>  		goto out_free;
>>
>> Sigh...  See that
>>         state = kzalloc(sizeof(*state), GFP_KERNEL);
>> 	if (!state)
>> 		goto out_err;
>> above?
>>
>> IOW, this will quietly generate broken code if built with gcc (and refuse to
>> compile with clang).  Yeah, this one is trivially fixed (return -ENOMEM instead
>> of a goto), but...
>>
>> __cleanup() can be useful, but it's really *not* safe for blind use; you
>> need to watch out for changed scopes (harmless in case of device_node)
>> and for gotos (broken here).
> 
> Hi Al Viro,
> 
> sorry, but I think I don't get you. First, I don't see sparc64 as a
> supported architecture for clang in the Linux documentation. Maybe the
> documentation is not up-to-date, but I tried to compile with clang and
> it seems to be true that it is not supported. Anyway, that is not the
> issue here.
> 
> Second, I might be missing something about the scopes you are
> mentioning. 'state' gets allocated before the device_node is declared,
> and when the device_node is declared and its initialization fails, it
> should jump to 'out_free' to free 'state', shouldn't it? Sorry if I have
> overlooked something here.
> 
> Thank your for your feedback and best regards,
> Javier Carrasco
> 


I think that the issue you are talking about is that the goto will
trigger the cleanup function of the device_node, which will not be
initialized at that point.

Yes, the goto before the device_node declaration hurts, and a return as
you said would be better.

Thanks and best regards,
Javier Carrasco

