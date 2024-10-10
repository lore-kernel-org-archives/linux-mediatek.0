Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED21D24459
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 23:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRo5pZaJYjcwJ3wqBtd7Mqnyiz4mZlGFWnd1eshq0HI=; b=xOC2vZMDIuauwPAHYQL9nmQojy
	O3HBG5HPzieF4W+wkdp8+WTPBaVd0f4rxPnesmxVenNTFUR5droWDi0gDuVv20OA/Zyy7nEuGb6RJ
	YhL+Awv9wUYS6YRdysspl/Fjfszans21aIkDul2CbfXKrunrslrisufvmlxzKXSLVDOLvDVU1KSw+
	ThUh+t0UaImI8qAqoT9WZ2gan6NkuuasO8Q1d+RH9xYzoSCqAhgijdIk0feWubM65qEFWV2ijIQKW
	dwJTtqXYIDYxOTdqhNdiBeOhkQkp0ZklT4T7Et7lvmSYGaZd4LNplzNJZCHnJ3G4u7lv7KpruT4vX
	7+NtzG7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz2OS-0000000Edks-3ND5;
	Thu, 10 Oct 2024 23:16:28 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz1EI-0000000EUtS-2NiH;
	Thu, 10 Oct 2024 22:01:56 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-37d4ac91d97so957659f8f.2;
        Thu, 10 Oct 2024 15:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728597712; x=1729202512; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qRo5pZaJYjcwJ3wqBtd7Mqnyiz4mZlGFWnd1eshq0HI=;
        b=QBPOl/EkQ+JxjSuuct5MsBzfkVGiHqSrVt+eb6+ZYR/6eMnaTkqUNX8WCw0k4xkzCY
         JAbTdMfAuybBPuJDIc7xj1UZXBY0Vk1UOxPxbc2ChMbjzfE9uf2huqofl8gp+VcIRlSs
         WpHibmb91+GIl9Y7VwaYTheK8aOSRQZjxpTS6Y9FGnUtuhqUb7INSoWVB0hdFbedfeGU
         vHgKtbt2ROvxSEYbQ0CiS9h+DYy53+teH0nthCt6R9bFPDCF7uiHm0PvZgj+Q5ZfKtmy
         2LA7yicf2QO3fZxBD8xR5FKWv/PmnzK+2bFAH27QNoMfv7xTEnklbTQ9kmnuZSiEfQdd
         +xAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728597712; x=1729202512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qRo5pZaJYjcwJ3wqBtd7Mqnyiz4mZlGFWnd1eshq0HI=;
        b=JiFqxSF3MBcm1E1bWSZuHPx3tl67/FizMiSqmzOkht33jLCpj8HFFbSn0KB7FBAVZ5
         rTfDvgOkFktTyyqgOrQw43t88jR7lvfKlZpf1JWU3FU4+hsQvViOJIcDgErwRXw/ItvZ
         /Jzlz65cVTXqxNZbCbKISlUAeEbUOL2Bd49AvoAro59qcNNd13PEKTA8E9SPn7e/mnOs
         4IU6o2/GxtqwGODcdHzyRPA3UV1LrUi2fcAf+sv3JeIN3BY6v614U09+Jjt3yYdXeFoB
         JobY4NHr1NqeIp69vGfcw7tiyWAxnd8guOqg3b9wS3cK09akIeeCNILZfSL1LV/JVmH8
         lFGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT0zXccF02Fe0hW6fjlhblxH4vYf/LXZJSRbr2BlR8you8DcxQbKgv+I6rgyoeuBGzZm3OmTVlN0cSGZY4taQ=@lists.infradead.org, AJvYcCVMaumK6JgXvlDBsd2cQ88YN5fiKYK4YG8zmIzgLXo14845ml3HBKN6olRpRwyEcBKRf9HAN9scBY4OMKfc4cYW@lists.infradead.org, AJvYcCX7wEPYgBZD5gEd94Bm5ZuvyWUS0QJrBJlljRZbnFeH4jbOeerOdilWiu2RoBMRkMo8//O8WPLWZ610sFGkO7REbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWa8z4fMy2w94gc9kSu8IlAkLGr/dMKP4+r6FUuu/svixHZtaB
	/HYzqePu1lDDQGTcDjRkv8LzQraWhk6ad+fwiGJedEQJoPZP9rw1nR8fd5MK
X-Google-Smtp-Source: AGHT+IGXyz41JoTVviqZ6D56nKWyD7SMBw2XM/zgZy0gAt+4cCNQIYl2jc1hqRENs3/tmimOyBTBmQ==
X-Received: by 2002:a5d:67cf:0:b0:37d:2de3:bf8a with SMTP id ffacd0b85a97d-37d551d541amr439244f8f.26.1728597712420;
        Thu, 10 Oct 2024 15:01:52 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:3d08:841a:562:b7b5? (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182d793fsm26275335e9.9.2024.10.10.15.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 15:01:51 -0700 (PDT)
Message-ID: <22e55eb1-8aa6-43fa-8020-d18f9f6aa6f8@gmail.com>
Date: Fri, 11 Oct 2024 00:01:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] Input: sparcspkr - use cleanup facility for
 device_node
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
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20241010214348.GD4017910@ZenIV>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_150154_644973_C2746EBC 
X-CRM114-Status: GOOD (  19.44  )
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

On 10/10/2024 23:43, Al Viro wrote:
> On Thu, Oct 10, 2024 at 11:25:56PM +0200, Javier Carrasco wrote:
>>
>> diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
>> index 20020cbc0752..bb1c732c8f95 100644
>> --- a/drivers/input/misc/sparcspkr.c
>> +++ b/drivers/input/misc/sparcspkr.c
>> @@ -188,7 +188,6 @@ static int bbc_beep_probe(struct platform_device *op)
>>  {
>>  	struct sparcspkr_state *state;
>>  	struct bbc_beep_info *info;
>> -	struct device_node *dp;
>>  	int err = -ENOMEM;
>>  
>>  	state = kzalloc(sizeof(*state), GFP_KERNEL);
>> @@ -199,14 +198,13 @@ static int bbc_beep_probe(struct platform_device *op)
>>  	state->event = bbc_spkr_event;
>>  	spin_lock_init(&state->lock);
>>  
>> -	dp = of_find_node_by_path("/");
>>  	err = -ENODEV;
>> +	struct device_node *dp __free(device_node) = of_find_node_by_path("/");
>>  	if (!dp)
>>  		goto out_free;
> 
> Sigh...  See that
>         state = kzalloc(sizeof(*state), GFP_KERNEL);
> 	if (!state)
> 		goto out_err;
> above?
> 
> IOW, this will quietly generate broken code if built with gcc (and refuse to
> compile with clang).  Yeah, this one is trivially fixed (return -ENOMEM instead
> of a goto), but...
> 
> __cleanup() can be useful, but it's really *not* safe for blind use; you
> need to watch out for changed scopes (harmless in case of device_node)
> and for gotos (broken here).

Hi Al Viro,

sorry, but I think I don't get you. First, I don't see sparc64 as a
supported architecture for clang in the Linux documentation. Maybe the
documentation is not up-to-date, but I tried to compile with clang and
it seems to be true that it is not supported. Anyway, that is not the
issue here.

Second, I might be missing something about the scopes you are
mentioning. 'state' gets allocated before the device_node is declared,
and when the device_node is declared and its initialization fails, it
should jump to 'out_free' to free 'state', shouldn't it? Sorry if I have
overlooked something here.

Thank your for your feedback and best regards,
Javier Carrasco


