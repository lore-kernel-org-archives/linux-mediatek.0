From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: Aw: Re: [PATCH] mfd: mt6397: fix probe after changing mt6397-core
Date: Sat, 5 Oct 2019 10:16:08 +0200
Message-ID: <3dcb030d-006e-7518-2679-48726d0c4e0e@gmail.com>
References: <20191003185323.24646-1-frank-w@public-files.de>
 <20191004152001.GS18429@dell>
 <trinity-c33ab112-57a5-47d6-80e5-13c96442e302-1570204319219@3c-app-gmx-bap10>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <trinity-c33ab112-57a5-47d6-80e5-13c96442e302-1570204319219@3c-app-gmx-bap10>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Frank Wunderlich <frank-w@public-files.de>, Lee Jones <lee.jones@linaro.org>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org



On 04/10/2019 17:51, Frank Wunderlich wrote:
> This Question goes to Hsin-Hsiung Wang ;)
> 
> i only took his code (and splitted the 3rd part) to get mt6323 working again without reverting the other 2 Patches
>> regards Frank
> 
> 
>> Gesendet: Freitag, 04. Oktober 2019 um 17:20 Uhr
>> Von: "Lee Jones" <lee.jones@linaro.org>
> 
>> Will there be other devices which have a !0 CID shift?
> 

Frank, a quick look at the series would have given you the answer.
@Lee: yes, this change is the preparation to support MT6358:
https://patchwork.kernel.org/patch/11110515/

Regards,
Matthias
