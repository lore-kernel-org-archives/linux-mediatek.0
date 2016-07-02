From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v5 7/9] ASoC: bt-sco: extend rate and add a
 general compatible string
Date: Sat, 2 Jul 2016 17:05:21 +0800
Message-ID: <CAGb2v67rgj4efyTZpZ-79NnCRM=KLJCJedte594qgSjMMB5xsQ@mail.gmail.com>
References: <1466149440-23889-1-git-send-email-garlic.tseng@mediatek.com>
 <1466149440-23889-8-git-send-email-garlic.tseng@mediatek.com>
 <20160629191500.GU6247@sirena.org.uk> <1467291345.11091.16.camel@mtksdaap41>
 <1467341386.21689.6.camel@mtksdaap41> <20160701161105.GY6247@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20160701161105.GY6247@sirena.org.uk>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, ir.lian@mediatek.com, srv_heupstream@mediatek.com, tiwai@suse.de, Garlic Tseng <garlic.tseng@mediatek.com>, linux-kernel <linux-kernel@vger.kernel.org>, koro.chen@mediatek.com, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, PC.Liao@mediatek.com, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi,

On Sat, Jul 2, 2016 at 12:11 AM, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Jul 01, 2016 at 10:49:46AM +0800, Garlic Tseng wrote:
>> On Thu, 2016-06-30 at 20:55 +0800, Garlic Tseng wrote:
>
>> > If you worry about some potential risk (I don't see any) maybe we have
>> > to develop another dummy bt-sco codec driver which support both 8k and
>> > 16k?
>
>> Ah! If someone whose bluetooth modules only support 8k use the driver,
>> they might be broken, right? Maybe we can add another snd_soc_dai_driver
>> which can support both 8k and 16k.
>> (Actually I found the issue is discussed before
>> http://mailman.alsa-project.org/pipermail/alsa-devel/2014-November/084687.html )
>
> Yes, that'd be fine - it could be the same driver and register different
> parameters depending on config/compatible.

Could we also make this driver directly configurable from Kconfig,
and not just selected by platforms (currently Samsung) or by building
all coddecs?

Thanks
ChenYu
