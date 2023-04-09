Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFC9C77B70
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Apr 2023 12:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sjCjsfv26tkwL33cYuaCIiIygw6W5wLP/nI9o69MBE=; b=w/Lx3Tl565gVVj3C0ryXvWX4uk
	d8pYA60IMvPWcR0mLduk9OZTAsrz8eqEAT0XyZ/rVzX3WW/kmJuj9rrb6eW0vK6Fb0z8sja52bL1k
	y5V9nbboxqt5ahghdFQAvVRQchxg5ZBHY4YNBCTX33IePBDafbv1xUFXaxHe1RlyOGl3z7HnFj5D/
	ImcfGJ3Y0lCXPpq6Kg1LefdupSWXPJLkRLOXRiK3sOZPFwM9rnyhaLqhj/EfqNQ4ElGlew4lMxISP
	7Bq/L7uhdyR5iWh0ukwG8zkBQAziv4ur5n8/0NX7XVFg8W5qqVhMVlFGV3UqWf/zr4tkUIfDh/cVv
	FgBTVS6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plUCJ-00DhxE-2R;
	Sun, 09 Apr 2023 12:31:07 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plUCF-00DhwM-1z;
	Sun, 09 Apr 2023 12:31:05 +0000
Received: by mail-pl1-x632.google.com with SMTP id ik20so2384830plb.3;
        Sun, 09 Apr 2023 05:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681043462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/sjCjsfv26tkwL33cYuaCIiIygw6W5wLP/nI9o69MBE=;
        b=knP/zr0lg3cA56UTp147xq5KaWNFpUT6fj2NAYVrCspJgHf4+T0aw8tQvplFo3+jmS
         LCh467KwtrloXokQo8xWWqOPNQ6JOlg0A34GEvR3dmNAQ5jduLziBGAIG9CudtsJxtrV
         7Zm9Ku+FslXcMzQXg0nL0++Wpx+UTYz90ybiY7f+oRQ62Gs9C3FxxCCNA33pzI6oJi4C
         pjFiZLfcPa0Ay3qxbdwc9K//Y096/OoOvuNqVONyK8anac2vGYTs2bLtE1nykBBHqS6C
         lLImrVfpaBLIwYI59opSsLjCDKL8nUc13223uPWh+aMbkpJDjf8IH+heZ9a9YXGJGnig
         VAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681043462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/sjCjsfv26tkwL33cYuaCIiIygw6W5wLP/nI9o69MBE=;
        b=LRGJmUHC4GgPAQ0STV+aHgsencIiQhSv/35pcpWb1lGs0430YNrYPfbiQPcPyM6Cgk
         2SBPS+J1wycb17JRVO9jZYuKCJ5u+ZYFm8GR+h08oCsvD69er3MIWmvecNS+1/LrJq/V
         jb9k+9jszPBLusOIIk7W87aOFCoqKszhRuuAmtANfQWp/A5SQZH/gvEkQ6ZGXjKxz8Dd
         e0xmpbOukO0bzyIDCFK/sACrgs1RodcX6QNFyND8vV23BoMfgr+pGq5Z/nCePGm4VG1Q
         tAK3afXhEbJddGg2xt/P6gHrVRV4+w/aJJECySnRe4cU9E+MkXjclBl5rfLPHgs4V6Sl
         bdOw==
X-Gm-Message-State: AAQBX9edGyf8Q9K4T8HD6wrd6K904P0FlJ1IIP53MNsULe1nWZb6XCMD
	N0mNFLvajELh7UiLcj/+6jM=
X-Google-Smtp-Source: AKy350Zi0/jHiXU7qIaSCN3O1DJL5eFsyUZRuJgq7cd2DopUoKCuA1EtplmHA8nvTTwnIYiRy6P0Sw==
X-Received: by 2002:a17:903:7cd:b0:19e:674a:1fb9 with SMTP id ko13-20020a17090307cd00b0019e674a1fb9mr8024227plb.69.1681043461624;
        Sun, 09 Apr 2023 05:31:01 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-11.three.co.id. [116.206.28.11])
        by smtp.gmail.com with ESMTPSA id s31-20020a63ff5f000000b005182bfef363sm2034215pgk.34.2023.04.09.05.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 05:31:00 -0700 (PDT)
Message-ID: <b05d80ab-fd72-1346-f5d9-b80ae9b5cd1a@gmail.com>
Date: Sun, 9 Apr 2023 19:30:53 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] ring-buffer: Prevent inconsistent operation on
 cpu_buffer->resize_disabled
To: Tze-nan Wu <Tze-nan.Wu@mediatek.com>, rostedt@goodmis.org,
 mhiramat@kernel.org
Cc: bobule.chang@mediatek.com, wsd_upstream@mediatek.com,
 stable@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230408052226.25268-1-Tze-nan.Wu@mediatek.com>
 <20230409024616.31099-1-Tze-nan.Wu@mediatek.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230409024616.31099-1-Tze-nan.Wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230409_053103_675502_24B32A42 
X-CRM114-Status: GOOD (  10.93  )
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

On 4/9/23 09:46, Tze-nan Wu wrote:
> This issue can be reproduced by "echo 0 > trace" and hotplug cpu at the
> same time. After reproducing success, we can find out buffer_size_kb
> will not be functional anymore.
> 

Do you mean disabling tracing while hotplugging CPU? Or disabling both
tracing and hotplug CPU?

> This patch uses cpus_read_lock() to prevent cpu_online_mask being changed
> between two different "for_each_online_buffer_cpu".
> 

"Use cpu_read_lock() to prevent ..."

> Changes in v2:
>   Use cpus_read_lock() instead of copying cpu_online_mask at the entry of
>   function
> 

To resolve kernel test robot warnings ([1] and [2])? Or have they been fixed?

[1]: https://lore.kernel.org/stable/202304081615.eiaqpbV8-lkp@intel.com/
[2]: https://lore.kernel.org/stable/202304082051.Dp50upfS-lkp@intel.com/

Thanks.

-- 
An old man doll... just what I always wanted! - Clara


